import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_links_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_meta_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_farmer_entity2.g.dart';

@JsonSerializable()
class AllFarmerListResp2 {
  AllFarmerListResp2({
    required this.data,
    required this.links,
    required this.meta,
  });

  /// factory.
  factory AllFarmerListResp2.fromJson(Map<String, dynamic> json) =>
      _$AllFarmerListResp2FromJson(json);
  final List<FarmerEntity> data;
  final ProductLinks? links;
  final ProductMeta? meta;
}
