import 'package:json_annotation/json_annotation.dart';

part 'main_weather.g.dart';

@JsonSerializable()
class Main {
  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });
  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;
}
