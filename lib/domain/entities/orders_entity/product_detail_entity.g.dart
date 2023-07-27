// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailEntity _$ProductDetailEntityFromJson(Map<String, dynamic> json) =>
    ProductDetailEntity(
      company_id: json['company_id'] as String?,
      category: json['category'] as String?,
      company: json['company'] as String?,
      description: json['description'] as String?,
      discount: json['discount'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      preferred: json['preferred'] as String?,
      product_id: json['product_id'] as String?,
      sell_price: json['sell_price'] as String?,
      status: json['status'] as String?,
      subcategory: json['subcategory'] as String?,
      total_order: json['total_order'] as int?,
      unit_id: json['unit_id'] as String?,
    );

Map<String, dynamic> _$ProductDetailEntityToJson(
        ProductDetailEntity instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'category': instance.category,
      'company_id': instance.company_id,
      'company': instance.company,
      'unit_id': instance.unit_id,
      'sell_price': instance.sell_price,
      'status': instance.status,
      'total_order': instance.total_order,
      'preferred': instance.preferred,
      'subcategory': instance.subcategory,
      'discount': instance.discount,
    };
