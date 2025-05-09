import 'dart:convert';
import 'dart:isolate';

import 'package:deshifarmer/core/analytics/firebase_analytics_custom.dart';
import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/core/usecase/location_current.dart';
import 'package:deshifarmer/domain/entities/weather/weather_entity.dart';
import 'package:http/http.dart' as http;

///! Get weather
Future<WeatherEntity?> getCurrentWeather() async {
  final currentPosition = await determinePosition();
  final url = Uri.parse(
    ApiDatabaseParams.getCurrentWeatherURL(
      currentPosition.latitude.toString(),
      currentPosition.longitude.toString(),
    ),
  );
  final headers = <String, String>{
    'Accept': 'application/json',
    // 'Authorization': 'Bearer ${ApiKeys.urlBayToken}',
  };
  try {
    final response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      final result = await Isolate.run(() => json.decode(response.body))
          as Map<String, dynamic>;
      try {
        final successResonse = WeatherEntity.fromJson(result);
        return successResonse;
      } catch (e) {
        FirebaseAnalyticsCustom.customLogEvent(
          name: 'weather_error',
          parameters: {
            'error': e.toString(),
            'url': url.toString(),
            'body': response.body,
          },
        );
      }
      return null;
    } else {
      FirebaseAnalyticsCustom.customLogEvent(
        name: 'weather_error',
        parameters: {
          'error': response.statusCode,
          'url': url.toString(),
          'body': response.body,
        },
      );
      return null;
    }
  } catch (e) {
    FirebaseAnalyticsCustom.customLogEvent(
      name: 'weather_error',
      parameters: {
        'error': e.toString(),
        'url': url.toString(),
      },
    );
    return null;
  }
}
