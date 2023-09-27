import 'package:json_annotation/json_annotation.dart';

part 'coord_weather.g.dart';

@JsonSerializable()
class Coord {
  const Coord({
    required this.lon,
    required this.lat,
  });
  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
  final double lon;
  final double lat;
}
