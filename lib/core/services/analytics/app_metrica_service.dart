import 'package:appmetrica_plugin/appmetrica_plugin.dart';

import 'i_analytics.dart';

class AppMetricaService implements IAnalytics {
  static const _config = AppMetricaConfig(
    '78a3c049-a2ed-48af-a956-8d9fe281d39d',
    // 'f3dc2d61-7a2c-4b2a-8867-109c4c1c98e0',
    logs: true,
  );

  @override
  Future<void> init() async {
    return AppMetrica.activate(_config);
  }

  @override
  Future<void> setUserProfile(uid) {
    return AppMetrica.setUserProfileID(uid);
  }

  @override
  Future<void> reportEvent(String eventName, [Map<String, Object>? payload]) {
    return payload != null
        ? AppMetrica.reportEventWithMap(eventName, payload)
        : AppMetrica.reportEvent(eventName);
  }
}
