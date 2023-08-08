// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailEntity _$OrderDetailEntityFromJson(Map<String, dynamic> json) =>
    OrderDetailEntity(
      created_at: json['created_at'] as String?,
      delivery_address: json['delivery_address'] as String?,
      delivery_contact: json['delivery_contact'] as String?,
      distributor_id: json['distributor_id'] as String?,
      distributor_name: json['distributor_name'] as String?,
      farmer_address: json['farmer_address'] as String?,
      farmer_id: json['farmer_id'] as String?,
      farmer_name: json['farmer_name'] as String?,
      id: json['id'] as int?,
      location: json['location'] as String?,
      me_id: json['me_id'] as String?,
      me_order_id: json['me_order_id'] as String?,
      product_details: json['product_details'] == null
          ? null
          : ProductDetailEntity.fromJson(
              json['product_details'] as Map<String, dynamic>,),
      product_id: json['product_id'] as String?,
      quantity: json['quantity'] as int?,
      status: json['status'] as String?,
      total_price: json['total_price'] as int?,
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$OrderDetailEntityToJson(OrderDetailEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'total_price': instance.total_price,
      'product_details': instance.product_details,
      'me_order_id': instance.me_order_id,
      'me_id': instance.me_id,
      'distributor_id': instance.distributor_id,
      'distributor_name': instance.distributor_name,
      'delivery_address': instance.delivery_address,
      'delivery_contact': instance.delivery_contact,
      'product_id': instance.product_id,
      'unit': instance.unit,
      'status': instance.status,
      'created_at': instance.created_at,
      'location': instance.location,
      'farmer_id': instance.farmer_id,
      'farmer_name': instance.farmer_name,
      'farmer_address': instance.farmer_address,
    };
