import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_link_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_farmer_entity.g.dart';

@JsonSerializable()
class AllFarmerListRespEntity {

  AllFarmerListRespEntity({
    required this.data,
    required this.links,
  required this.meta,
  });

  /// factory.
  factory AllFarmerListRespEntity.fromJson(Map<String, dynamic> json) =>
      _$AllFarmerListRespEntityFromJson(json);
  // ignore: avoid_multiple_declarations_per_line, non_constant_identifier_names
  final List<FarmerEntity> data;
  final FarmerLinks? links;
  final FarmerMeta? meta;
}
