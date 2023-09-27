import 'package:json_annotation/json_annotation.dart';

part 'sys_weather.g.dart';

@JsonSerializable()
class Sys {
  const Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;
}
