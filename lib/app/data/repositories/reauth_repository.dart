import 'package:dartz/dartz.dart';
import 'package:neuro_wood/app/domain/repositories/i_reauth_repository.dart';
import 'package:neuro_wood/core/failure/failure.dart';
import 'package:neuro_wood/core/services/firebase/firebase_auth/fas_state.dart';
import 'package:neuro_wood/core/services/firebase/firebase_data_source.dart';

class ReauthRepository implements IReauthRepository {
  final FirebaseDataSource firebaseDataSource;
  bool _authWithCloud = false;
  String? _uid;

  ReauthRepository({required this.firebaseDataSource});

  @override
  Future<FASState> resendCode() async {
    _authWithCloud = true;
    final res = await firebaseDataSource.signInWithPhoneCloud(firebaseDataSource.currentUser!.phoneNumber!);
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
      return firebaseDataSource.reauthWithCode(code);
    }
  }

  @override
  Future<FASState> sendPhone() async {
    _authWithCloud = false;
    return await firebaseDataSource.signInWithPhone(firebaseDataSource.currentUser!.phoneNumber!);
  }
}
