// ignore_for_file: non_constant_identifier_names

import 'package:deshifarmer/presentation/pages/activity/models/fertilization_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/models/land_prep_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/models/pesticide_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/models/sowing_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/models/watering_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch_reponse_entity.g.dart';

@JsonSerializable()
class BatchResponseEntity {

  BatchResponseEntity({
    required this.land_preparation,
    required this.sowing,
    required this.fertilization,
    required this.pesticide,
    required this.watering,
    required this.sourcing,
  });

  factory BatchResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$BatchResponseEntityFromJson(json);
  final LandPrepEntity? land_preparation;
  final SowingEntity? sowing;
  final FertilizerEntity? fertilization;
  final PesticideEntity? pesticide;
  final WateringEntity? watering;
  final dynamic sourcing;
}
