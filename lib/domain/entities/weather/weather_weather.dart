import 'package:json_annotation/json_annotation.dart';

part 'weather_weather.g.dart';

@JsonSerializable()
class Weather {
  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  final int id;
  final String main;
  final String description;
  final String icon;
}
