import 'package:json_annotation/json_annotation.dart';

part 'wind_weather.g.dart';

@JsonSerializable()
class Wind {
  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  final double speed;
  final int deg;
  final double gust;
}
