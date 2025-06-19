import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
import 'package:neuro_wood/core/failure/failure.dart';

import 'fas_state.dart';

///Обертка для работы с авторизацией firebase
class FirebaseAuthService {
  final FirebaseAuth _fa = FirebaseAuth.instance;
  Function(User?)? _onData;
  StreamSink<FASState>? _streamSink;
  String _verificationId = '';
  int? _resendToken;

  FirebaseAuthService() {
    // if (kDebugMode) {
    //   _fa.useAuthEmulator("localhost", 9099);
    // }
  }

  init() {
    _fa.authStateChanges().listen(_onData);
  }

  checkAuth() {
    return _fa.currentUser != null;
  }

  Future<Either<FirebaseAuthFailure, bool>> deleteUser() async {
    // return left(FirebaseAuthFailure(FirebaseAuthException(code: "requires-recent-login")));
    try {
      await _fa.currentUser?.delete();
      return right(true);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseAuthFailure(e));
      // if (e.code == "requires-recent-login") {}
    }
  }

  Future<Either<FirebaseAuthFailure, bool>> reauthWithCode(String code) async {
    try {
      final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: code,
      );
      final _ = await _fa.currentUser!.reauthenticateWithCredential(
        authCredential,
      );
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return Left(FirebaseAuthFailure(e));
    }
  }

  Future<UserCredential> signInWithToken(String token) {
    return _fa.signInWithCustomToken(token);
  }

  User? get currentUser => _fa.currentUser;

  a() {
    // _fa.
    final credential = PhoneAuthProvider.credentialFromToken(0);
    _fa.currentUser!.reauthenticateWithCredential(credential);
  }

  ///Метод для авторизации по номеру телефона
  Future<FASState> signInWithPhone(String phoneNumber) async {
    try {
      // StreamController<FASState>? _sc = StreamController<FASState>();
      Completer<FASState> comp = Completer<FASState>();
      _fa.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (AuthCredential authCredential) {
          log("phone verified : Token ${authCredential.token}");
          // _streamSink?.add(const FASState.phoneVerificationCompleted());
          // _sc?.sink.add(const FASState.phoneVerificationCompleted());
          if (!comp.isCompleted) {
            comp.complete(const FASState.phoneVerificationCompleted());
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          log("phone failed : ${e.message},${e.code}");
          // _streamSink?.add(FASState.phoneVerificationError(code: e.code, message: e.message));
          // _sc?.sink.add(FASState.phoneVerificationError(code: e.code, message: e.message));
          if (!comp.isCompleted) {
            comp.complete(
              FASState.phoneVerificationError(code: e.code, message: e.message),
            );
          }
        },
        timeout: const Duration(seconds: 30),
        codeSent: (String verificationId, int? forceResendingToken) {
          log("Code send $verificationId $forceResendingToken");
          // _streamSink?.add(const FASState.phoneVerificationCompleted());
          // _sc?.sink.add(const FASState.phoneVerificationCompleted());
          _resendToken = forceResendingToken;
          _verificationId = verificationId;
          if (!comp.isCompleted) {
            comp.complete(const FASState.phoneVerificationCompleted());
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
          //  _streamSink?.add(const FASState.phoneVerificationError(code: '0', message: 'TIMEOUT'));
          // _sc?.sink.add(const FASState.phoneVerificationError(code: '0', message: 'TIMEOUT'));
          if (!comp.isCompleted) {
            comp.complete(
              const FASState.phoneVerificationError(
                code: '0',
                message: 'TIMEOUT',
              ),
            );
          }

          log("time out :$verificationId");
        },
      );
      // FASState res = await _sc.stream.first;
      // _sc.close();
      // _sc = null;
      final s = await comp.future;
      return s;
    } catch (e) {
      log('FIREBASE AUTH exc: $e');
      return const FASState.phoneVerificationError(code: '0');
    }
  }

  ///Метод для подтверждения смс
  Future<Either<FirebaseAuthFailure, bool>> confirmAuth(String code) async {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: code,
    );
    try {
      var _ = await _fa.signInWithCredential(authCredential);
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(FirebaseAuthFailure(e));
    }
  }

  Future<void> logout() async {
    return await _fa.signOut();
  }

  @Deprecated('use cloud functions')
  Future<void> resendCode(String phoneNumber) async {
    return await _fa.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (AuthCredential authCredential) {
        log("phone verified : Token ${authCredential.token}");
        _streamSink?.add(const FASState.phoneVerificationCompleted());
      },
      verificationFailed: (FirebaseAuthException e) {
        log("phone failed : ${e.message},${e.code}");
        _streamSink?.add(
          FASState.phoneVerificationError(code: e.code, message: e.message),
        );
      },
      forceResendingToken: _resendToken,
      timeout: const Duration(seconds: 30),
      codeSent: (String verificationId, int? forceResendingToken) {
        log("Code send $verificationId $forceResendingToken");
        _streamSink?.add(const FASState.phoneVerificationCompleted());
        _resendToken = forceResendingToken;
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
        log("time out :$verificationId");
      },
    );
  }

  set onData(Function(User?) fn) => _onData = fn;
  set sink(StreamSink<FASState>? sink) => _streamSink = sink;
}
