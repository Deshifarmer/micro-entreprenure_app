import 'package:json_annotation/json_annotation.dart';

part 'clouds_weather.g.dart';

@JsonSerializable()
class Clouds {
  const Clouds({
    required this.all,
  });
  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
  final int all;
}
