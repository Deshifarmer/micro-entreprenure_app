// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'land_prep_entity.g.dart';

@JsonSerializable()
class LandPrepEntity {

  LandPrepEntity({
    required this.images,
    required this.land_preparation_date,
    required this.details,
  });

  factory LandPrepEntity.fromJson(Map<String, dynamic> json) =>
      _$LandPrepEntityFromJson(json);
  final List<String> images;
  final String land_preparation_date;
  final String details;
}
