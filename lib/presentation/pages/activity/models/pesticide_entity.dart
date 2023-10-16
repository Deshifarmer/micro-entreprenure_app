
// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'pesticide_entity.g.dart';
@JsonSerializable()
class PesticideEntity{
  PesticideEntity({
    required this.pesticide_type,
    required this.pesticide_name,
    required this.amount,
    required this.details,
    required this.created_at,
    required this.updated_at,
  });

  factory PesticideEntity.fromJson(Map<String, dynamic> json) =>
      _$PesticideEntityFromJson(json);
  final String pesticide_type;
  final String pesticide_name;
  final String amount;
  final String details;
  final String created_at;
  final String updated_at;
}
