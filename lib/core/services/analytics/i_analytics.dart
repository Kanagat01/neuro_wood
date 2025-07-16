abstract class IAnalytics {
  Future<void> init();

  Future<void> reportEvent(String eventName, [Map<String, Object>? payload]);

  Future<void> setUserProfile(uid);
}
