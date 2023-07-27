// ignore_for_file: lines_longer_than_80_chars, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'farmer_detail_entity.g.dart';

@JsonSerializable()
class FarmerDetailEntity {
  FarmerDetailEntity({
    required this.farmer_name,
    required this.farmer_phone,
  });

  /// factory.
  factory FarmerDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$FarmerDetailEntityFromJson(json);
  // ignore: avoid_multiple_declarations_per_line
  final String? farmer_name;
  final String? farmer_phone;
}
