
// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'fertilization_entity.g.dart';
@JsonSerializable()
class FertilizerEntity{
  FertilizerEntity({
    required this.fertilizer_type,
    required this.fertilizer_name,
    required this.amount,
    required this.details,
    required this.created_at,
    required this.updated_at,
  });

  factory FertilizerEntity.fromJson(Map<String, dynamic> json) =>
      _$FertilizerEntityFromJson(json);
  final String fertilizer_type;
  final String fertilizer_name;
  final String amount;
  final String details;
  final String created_at;
  final String updated_at;
}
