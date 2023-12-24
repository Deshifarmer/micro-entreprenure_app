// ignore_for_file: non_constant_identifier_names

/*
        "details": "গড় তত ঘর রব ভয়",
        "hours": 10,
        "created_at": "2023-10-15T10:12:08.000000Z",
        "updated_at": "2023-10-15T10:12:08.000000Z"
*/

import 'package:json_annotation/json_annotation.dart';

part 'watering_entity.g.dart';

@JsonSerializable()
class WateringEntity {
  WateringEntity({
    required this.details,
    required this.hours,
    required this.created_at,
    required this.updated_at,
  });

  factory WateringEntity.fromJson(Map<String, dynamic> json) =>
      _$WateringEntityFromJson(json);
  final String details;
  final String hours;
  // final int hours;
  final String created_at;
  final String updated_at;
}
