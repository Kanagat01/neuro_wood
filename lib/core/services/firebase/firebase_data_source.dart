import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neuro_wood/app/data/model/function_response.dart';
import 'package:neuro_wood/app/data/model/location_model.dart';
import 'package:neuro_wood/app/data/model/measure_result_model.dart';
import 'package:neuro_wood/app/data/model/subscription_business/subscription_business.dart';
import 'package:neuro_wood/app/data/model/tariff_model.dart';
import 'package:neuro_wood/app/data/model/sortiment_model.dart';
import 'package:neuro_wood/app/data/model/bread_model.dart';
import 'package:neuro_wood/app/data/model/user_additional_model.dart';
import 'package:neuro_wood/app/data/model/user_model.dart';
import 'package:neuro_wood/app/data/model/vehicle_type_model.dart';
import 'package:neuro_wood/app/domain/entities/measure_request.dart';
import 'package:neuro_wood/app/domain/entities/mesure_result_entity.dart';
import 'package:neuro_wood/app/domain/entities/parameters_measure/parameters_wrapper.dart';
import 'package:neuro_wood/app/domain/entities/send_urls.dart';
import 'package:neuro_wood/app/domain/entities/tariff_entity.dart';
import 'package:neuro_wood/app/domain/entities/user_entity.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_crashlytics_service.dart';
import 'package:rxdart/rxdart.dart';

import 'firebase_auth/fas_state.dart';
import 'firebase_auth/firebase_auth_service.dart';
import 'firebase_cloud_service.dart';
import 'firebase_firestore_service.dart';
import 'firebase_storage_service.dart';

//фасад для работы с сервисами авторизации и firestore
class FirebaseDataSource {
  final FirebaseAuthService _auth;
  final FirebaseFirestoreService _firestore;
  final FirebaseStorageService _storage;
  final FirebaseCloudService _functions;
  final FirebaseCrashlyticsService crashlytics;
  UserEntity? _user;

  FirebaseDataSource({
    required FirebaseAuthService firebaseAuthService,
    required FirebaseFirestoreService firebaseFirestoreService,
    required FirebaseStorageService firebaseStorageService,
    required FirebaseCloudService firebaseCloudService,
    required FirebaseCrashlyticsService firebaseCrashlyticsService,
  })  : _auth = firebaseAuthService,
        _storage = firebaseStorageService,
        crashlytics = firebaseCrashlyticsService,
        _functions = firebaseCloudService,
        _firestore = firebaseFirestoreService {
    _auth.onData = _listenFA;
    _auth.sink = _authStream.sink;
    _auth.init();
  }

  final BehaviorSubject<FASState> _authStream =
      BehaviorSubject<FASState>.seeded(const FASState.initial());

  checkUser() {
    _auth.checkAuth();
  }

  _listenFA(User? event) async {
    if (event != null) {
      try {
        _user = await _getUserModelFromUser(event);
        crashlytics.setUID(_user!.uid);
        _authStream.sink.add(FASState.authorizedWithData(
          _user!,
        ));
      } catch (e) {
        _authStream.sink.add(FASState.authorized(user: event));
      }
    } else {
      _authStream.sink.add(const FASState.unauthorized());
    }
  }

  Future<FASState> signInWithPhone(String phoneNumber) async {
    return await _auth.signInWithPhone(phoneNumber);
  }

  // Future<FASState> resignInWithPhone() async {
  //   return await _auth.signInWithPhone(currentUser!.phoneNumber!);
  // }

  Future<Either<FirebaseAuthFailure, bool>> confirmAuth(String code) {
    return _auth.confirmAuth(code);
  }

  Future<FunctionVerifyPhoneResponse> signInWithPhoneCloud(
    String phone,
  ) async {
    return await _functions.signInWithPhone(phone);
  }

  Future<Either<FirebaseAuthFailure, bool>> reauthWithCode(
    String code,
  ) async {
    return _auth.reauthWithCode(code);
  }

  Future<Either<FirebaseAuthFailure, bool>> confirmAuthCloud(
    String uid,
    String code,
  ) async {
    try {
      final res = await _functions.confirmAuth(uid, code);
      await _auth.signInWithToken(res);
      return right(true);
    } on String catch (e) {
      return left(FirebaseAuthFailure(FirebaseAuthException(
        code: e,
      )));
    }
  }

  Future<Either<FirebaseAuthFailure, bool>> deleteUser() {
    return _auth.deleteUser();
  }

  Future<UserModel?> _getUserModelFromUser(User? user) async {
    if (user == null) {
      return null;
    }
    final rawUser = await _firestore.getUserByUid(user.uid);
    final tarifs = await getTarifs();
    final recognitionAvailable =
        tarifs.fold((l) => <int, SubscriptionBusiness>{}, (r) => r);
    return UserModel.fromFirebase(
      userMap: rawUser,
      user: user,
      recognitionAvailable: recognitionAvailable,
    );
  }

  Future<Either<FirestoreFailure, bool>> hasUser() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      return left(FirestoreFailure());
    }
    try {
      final rawUser = await _firestore.getUserByUid(currentUser.uid);
      final tarifs = await getTarifs();
      final recognitionAvailable =
          tarifs.fold((l) => <int, SubscriptionBusiness>{}, (r) => r);
      _user = UserModel.fromFirebase(
        userMap: rawUser,
        user: currentUser,
        recognitionAvailable: recognitionAvailable,
      );
      _authStream.sink.add(FASState.authorizedWithData(
        _user!,
      ));
      return right(true);
    } catch (e) {
      return left(FirestoreFailure());
    }
  }

  ///метод для регистрации пользователя
  Future<Either<FirestoreFailure, bool>> setUser(UserModel user) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return Left(FirestoreFailure());
      }
      var tarifsEither = await getTarifs();
      final tarifs =
          tarifsEither.fold((l) => <int, SubscriptionBusiness>{}, (r) => r);
      int? tariff;
      int? recognitionLeft;
      for (final t in tarifs.entries) {
        if (t.value.isDefault) {
          tariff = t.key;
          recognitionLeft = t.value.numMeasurements;
        }
      }
      final finalUser = UserModel.fromEntity(
        user.copyWith(
          subscription: SubscriptionEntity(
            recognitionLeft: recognitionLeft ?? 10,
            recognitionAvailable: recognitionLeft ?? 10,
            tariff: tariff ?? 1,
            isFree: true,
          ),
        ),
      );

      await _firestore.setUser(finalUser);
      final rawUser = finalUser.toDoc();
      rawUser['additional'] =
          await _firestore.getUserAdditionalDataByUid(user.uid);
      // rawUser['additional'] = await _firestore.getUserAdditionalDataByUid(user.uid);
      // final rawUser = await _firestore.getUserByUid(user.uid);

      _user = UserModel.fromFirebase(
        userMap: rawUser,
        user: currentUser,
        recognitionAvailable: tarifs,
      );
      _authStream.sink.add(FASState.authorizedWithData(
        _user!,
      ));
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(FirestoreFailure());
    }
  }

  Future<Either<FirestoreFailure, bool>> updateUser(UserModel user) async {
    try {
      await _firestore.updateUser(user);
      _user = user;
      _authStream.sink.add(FASState.authorizedWithData(
        _user!,
      ));
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(FirestoreFailure());
    }
  }

  Future<Either<FirestoreFailure, bool>> updateUserMeasurements(
      UserModel user) async {
    try {
      await _firestore.updateUserMeasurements(
        user.toUpdateMeasurements(),
        user.uid,
      );
      await _firestore
          .setAdditional(UserAdditionalModel.fromEntity(user.additional));
      _user = user;
      _authStream.sink.add(FASState.authorizedWithData(
        _user!,
      ));
      return const Right(true);
    } catch (e) {
      log(e.toString());
      return Left(FirestoreFailure());
    }
  }

  ///метод для редактирования пользователя
  Future<Either<FirestoreFailure, bool>> updateUserAdditional(
    UserAdditionalModel additional,
  ) async {
    try {
      await _firestore.setAdditional(additional);
      _user = _user?.copyWith(additional: additional);
      return const Right(true);
    } catch (e) {
      return Left(FirestoreFailure());
    }
  }

  Future<void> logout() async {
    await _auth.logout();
    _user = null;
    _authStream.sink.add(const FASState.unauthorized());
  }

  User? get currentUser => _auth.currentUser;

  Future<Either<FirestoreFailure, ParametersWrapper>> getAllParameters() async {
    try {
      final data = await _firestore.getAllParameters();
      final res = ParametersWrapper(
        locations: List<LocationModel>.from(
            data['locations'].map((e) => LocationModel.fromMap(e))),
        sortiment: List<SortimentModel>.from(
            data['sortiments'].map((e) => SortimentModel.fromMap(e))),
        breads: List<BreadModel>.from(
            data['breads'].map((e) => BreadModel.fromMap(e))),
        vehicleTypes: List<VehicleTypeModel>.from(
            data['vehicleType'].map((e) => VehicleTypeModel.fromMap(e))),
        baseUrl: data['baseUrl'],
      );
      return right(res);
    } catch (e) {
      log(e.toString());
      return Left(FirestoreFailure());
    }
  }

  Future<Either<FirestoreFailure, List<MeasureResultEntityBase>>>
      getMeasures() async {
    try {
      MeasureResultBuilder builder = MeasureResultBuilder();
      final data = await _firestore.getMeasures(_user!.uid);
      log(data.toString());
      List<MeasureResultEntityBase> res = [];
      for (Map<String, dynamic> e in data) {
        try {
          final r = builder.build(e);
          res.add(r);
        } catch (e) {
          log(e.toString());
        }
      }
      // final res = data.map((e) {
      //   try {
      //     final r = builder.build(e);
      //     return r;
      //   } catch (_) {}
      //   // return MeasureResultModelFinish.fromMap(e);
      // }).toList();
      log(res.toString());
      return right(res);
    } on FirestoreFailure catch (e) {
      return Left(e);
    }
  }

  Stream<List<MeasureResultEntityBase>?> getStreamMesures() {
    MeasureResultBuilder builder = MeasureResultBuilder();
    return _firestore.getStreamMesures(_user!.uid).map((event) {
      final List<MeasureResultEntityBase> res = [];
      if (event == null) {
        return null;
      }
      for (Map<String, dynamic> e in event) {
        try {
          final r = builder.build(e);
          res.add(r);
        } catch (e) {
          log(e.toString());
        }
      }
      return res;
      // return event?.map((e) => MeasureResultModelFinish.fromMap(e)).toList();
    });
  }

  Future<String?> getMeasureReport(String measureId) {
    return _storage.getMeasureReport(_user!.uid, measureId);
  }

  Future<bool> saveMeasureReport({
    required String measureId,
    required File file,
  }) {
    return _storage.saveMeasureReport(
      uid: _user!.uid,
      measureId: measureId,
      file: file,
    );
  }

  Future<String?> getMeasureImage(String measureId) {
    return _storage.getMeasureImage(_user!.uid, measureId);
  }

  Future<Either<FirestoreFailure, List<TariffEntity>>>
      getSubscriptions() async {
    try {
      final res = await _firestore.getSubscriptions();
      TariffModelsBuilder builder = TariffModelsBuilder();
      return right(builder.build(
        features: List<String>.from(res['features']),
        data: List<Map<String, dynamic>>.from(res['tariffs']),
      ));
    } on FirestoreFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(FirestoreFailure());
    }
  }

  Future<Either<FirestoreFailure, Map<int, SubscriptionBusiness>>>
      getTarifs() async {
    try {
      final res = await _firestore.getSubscriptionsBusiness();
      final subs = <int, SubscriptionBusiness>{};
      for (final item in res.entries) {
        subs[int.parse(item.key)] = SubscriptionBusiness.fromJson(item.value);
      }
      return right(subs);
    } on FirestoreFailure catch (e) {
      return left(e);
    } catch (e) {
      return left(FirestoreFailure());
    }
  }

  Stream<MeasureResultEntityBase?> subscribeOnMeasure(String measureId) {
    MeasureResultBuilder builder = MeasureResultBuilder();
    return _firestore.subscribeOnMeasure(_user!.uid, measureId).map((e) {
      log('STREAM: $e');
      if (e == null) {
        return null;
      }
      try {
        final r = builder.build(e);
        return r;
      } catch (e) {
        log('STREAM CATCH ERROR $e');
        return null;
      }
    });
  }

  Future<Either<FirestoreFailure, bool>> setMeasureData(
      String measureId, MeasureRequest measureRequest) async {
    try {
      log('setMeasureData');
      await _firestore.setMeasureData(
        uid: _user!.uid,
        measureId: measureId,
        data: measureRequest.toRequest(),
      );
      log('setMeasureData success');
      return right(true);
    } on FirestoreFailure catch (e) {
      log('setMeasureData error1 $e');
      return left(e);
    } catch (e) {
      log('setMeasureData error2 $e');
      return left(FirestoreFailure());
    }
  }

  Future<Either<FirestoreFailure, SendUrls>> getSendUrls() async {
    try {
      final data = await _firestore.getSendUrls();
      return right(SendUrls(
        backupUrl: data['backupUrl'],
        baseUrl: data['baseUrl'],
      ));
    } on FirestoreFailure catch (e) {
      log('setMeasureData error1 $e');
      return left(e);
    } catch (e) {
      log('setMeasureData error2 $e');
      return left(FirestoreFailure());
    }
  }

  Stream<FASState> get authStream => _authStream.stream;
  UserEntity? get user => _user;
}
