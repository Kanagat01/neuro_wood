import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/repositories/i_auth_repository.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_auth/fas_state.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseDataSource firebaseDataSource;
  bool _authWithCloud = false;
  String? _uid;

  AuthRepository({required this.firebaseDataSource});

  @override
  Stream<FASState> get authStream => firebaseDataSource.authStream;

  @override
  Future<FASState> resendCode(String phone) async {
    _authWithCloud = true;
    final res = await firebaseDataSource.signInWithPhoneCloud(phone);
    if (res.uid != null) {
      _uid = res.uid!;
      if (res.code == null) {
        return FASState.phoneVerificationCompleted(uid: _uid);
      }
    }
    return FASState.phoneVerificationError(code: res.code!);
  }

  @override
  Future<Either<FirebaseAuthFailure, bool>> sendCode(String code) {
    if (_authWithCloud) {
      return firebaseDataSource.confirmAuthCloud(_uid!, code);
    } else {
      return firebaseDataSource.confirmAuth(code);
    }
  }

  @override
  Future<FASState> sendPhone(String phone) async {
    _authWithCloud = false;
    return await firebaseDataSource.signInWithPhone(phone);
  }

  @override
  Future<void> logout() {
    _authWithCloud = false;
    _uid = null;
    return firebaseDataSource.logout();
  }

  @override
  void clear() {
    _authWithCloud = false;
    _uid = null;
  }
}
