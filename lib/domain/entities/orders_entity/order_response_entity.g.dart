// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) => OrderEntity(
      channel_id: json['channel_id'] as String?,
      created_at: json['created_at'] as String?,
      delivery_status: json['delivery_status'] as String?,
      distributor_commission: json['distributor_commission'] as String?,
      farmerDetail: json['farmerDetail'] == null
          ? null
          : FarmerDetailEntity.fromJson(
              json['farmerDetail'] as Map<String, dynamic>,),
      me_commission: json['me_commission'] as String?,
      me_id: json['me_id'] as String?,
      orderDetail: (json['orderDetail'] as List<dynamic>?)
          ?.map((e) => OrderDetailEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      order_id: json['order_id'] as String?,
      payment_id: json['payment_id'] as String?,
      payment_method: json['payment_method'] as String?,
      sold_to: json['sold_to'] as String?,
      status: json['status'] as String?,
      total_price: json['total_price'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$OrderEntityToJson(OrderEntity instance) =>
    <String, dynamic>{
      'order_id': instance.order_id,
      'me_id': instance.me_id,
      'channel_id': instance.channel_id,
      'total_price': instance.total_price,
      'sold_to': instance.sold_to,
      'status': instance.status,
      'payment_method': instance.payment_method,
      'payment_id': instance.payment_id,
      'delivery_status': instance.delivery_status,
      'distributor_commission': instance.distributor_commission,
      'me_commission': instance.me_commission,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'farmerDetail': instance.farmerDetail,
      'orderDetail': instance.orderDetail,
    };
