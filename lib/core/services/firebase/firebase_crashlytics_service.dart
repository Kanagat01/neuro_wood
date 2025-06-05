import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class FirebaseCrashlyticsService {
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  Future<void> setUID(String uid) {
    return _crashlytics.setUserIdentifier(uid);
  }

  Future<void> recordError({
    dynamic exception,
    StackTrace? stack,
    dynamic reason,
  }) async {
    return await _crashlytics.recordError(
      exception,
      stack,
      reason: reason,
      fatal: true,
    );
  }

  Future<void> recordErrorWithLogs({
    List<String>? logs,
    dynamic exception,
    StackTrace? stack,
    dynamic reason,
  }) async {
    for (String s in logs ?? []) {
      await log(s);
    }
    return await recordError(
      exception: exception,
      stack: stack,
      reason: reason,
    );
  }

  Future<void> log(String message) {
    return _crashlytics.log(message);
  }

  Future<void> deleteUnsentReports() {
    return _crashlytics.deleteUnsentReports();
  }
}
