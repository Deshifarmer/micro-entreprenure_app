// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      category: json['category'] as String?,
      company_id: json['company_id'] as String?,
      description: json['description'] as String?,
      discount: json['discount'] as String?,
      name: json['name'] as String?,
      preferred: json['preferred'] as String?,
      product_id: json['product_id'] as String?,
      sell_price: json['sell_price'] as String?,
      status: json['status'] as String?,
      subcategory: json['subcategory'] as String?,
      total_order: json['total_order'] as int?,
      unit_id: json['unit_id'] as String?,
      image: json['image'] as String,
      company: json['company'] as String?,
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'name': instance.name,
      'image': instance.image,
      'company': instance.company,
      'description': instance.description,
      'preferred': instance.preferred,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'company_id': instance.company_id,
      'unit_id': instance.unit_id,
      'sell_price': instance.sell_price,
      'discount': instance.discount,
      'status': instance.status,
      'total_order': instance.total_order,
    };
