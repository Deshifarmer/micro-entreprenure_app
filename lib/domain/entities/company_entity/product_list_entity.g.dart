// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListEntity _$ProductListEntityFromJson(Map<String, dynamic> json) =>
    ProductListEntity(
      role: json['role'] as String?,
      buy_price_from_company: json['buy_price_from_company'] as String?,
      image: json['image'] as String?,
      product_id: json['product_id'] as String?,
      product_name: json['product_name'] as String?,
      sell_price_from_company: json['sell_price_from_company'] as String?,
    );

Map<String, dynamic> _$ProductListEntityToJson(ProductListEntity instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'product_name': instance.product_name,
      'image': instance.image,
      'buy_price_from_company': instance.buy_price_from_company,
      'sell_price_from_company': instance.sell_price_from_company,
      'role': instance.role,
    };
