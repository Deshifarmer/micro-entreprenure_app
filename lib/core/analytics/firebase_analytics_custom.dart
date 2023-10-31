// import 'package:firebase_analytics/firebase_analytics.dart' show FirebaseAnalytics;

import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsCustom {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  //* custom event
  static Future<void> customLogEvent({
    required String name,
    required Map<String, dynamic> parameters,
  }) async {
    await analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}
