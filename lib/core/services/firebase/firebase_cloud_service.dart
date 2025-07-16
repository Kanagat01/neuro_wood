import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
// import 'package:flutter/foundation.dart';
import 'package:neuro_wood/app/data/model/function_response.dart';

class FirebaseCloudService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;
  static const String _verifyCode = "verifyCode";
  static const String _verifyPhone = "verifyPhone";

  FirebaseCloudService() {
    // if (kDebugMode) {
    //   _functions.useFunctionsEmulator('localhost', 5001);
    // }
  }

  ///авторизация через облако,
  ///возвращает `uid` пользователя,
  Future<FunctionVerifyPhoneResponse> signInWithPhone(String phoneNumber) async {
    try {
      HttpsCallable callable = _functions.httpsCallable(
        _verifyPhone,
        options: HttpsCallableOptions(
          timeout: const Duration(seconds: 10),
        ),
      );

      final res = await callable.call(<String, String>{
        "phone": phoneNumber,
      });
      log("CF - ${res.data}");
      final map = Map<String, String>.from(res.data);
      return FunctionVerifyPhoneResponse(
        uid: map['uid'],
        code: map['code'] == null ? null : _ErrorMapper.map(map['code']),
      );
    } catch (e) {
      // throw _ErrorMapper.map('error');
      return FunctionVerifyPhoneResponse(
        code: _ErrorMapper.map('error'),
      );
    }
  }

  ///подтверждение через облако
  ///возвращает токен,
  Future<String> confirmAuth(String uid, String code) async {
    try {
      HttpsCallable callable = _functions.httpsCallable(
        _verifyCode,
        options: HttpsCallableOptions(
          timeout: const Duration(seconds: 10),
        ),
      );

      final res = await callable.call(<String, String>{
        "uid": uid,
        "code": code,
      });
      log("CF - ${res.data}");
      final map = Map<String, String>.from(res.data);
      if (map.containsKey('code')) {
        throw _ErrorMapper.map(map['code']);
      } else if (map.containsKey('token')) {
        return map['token']!;
      }
      throw _ErrorMapper.map('error');
    } catch (e) {
      log(e.toString());
      if (e is String) {
        rethrow;
      }
      throw _ErrorMapper.map('error');
    }
  }
}

class _ErrorMapper {
  static const Map<String, String> _map = {
    "failed-create-user": "unexpected-error",
    "failed-save-code": "unexpected-error",
    "failed-send-sms": "unexpected-error",
    "could-not-find-record": "missing-phone-number",
    "code-incorrect": "invalid-verification-code",
    "code-expired": "session-expired",
    "failed-create-token": "unexpected-error",
    "blocked-1-h": "blocked-1-h",
    "blocked-24-h": "blocked-24-h",
    "error": "unexpected-error",
  };

  static String map(String? code) {
    return _map[code] ?? _map['error']!;
  }
}
