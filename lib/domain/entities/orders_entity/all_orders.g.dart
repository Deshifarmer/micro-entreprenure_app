// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllOrdersEntity _$AllOrdersEntityFromJson(Map<String, dynamic> json) =>
    AllOrdersEntity(
      data: (json['data'] as List<dynamic>)
          .map((e) => OrderEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : OrderLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : OrderMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllOrdersEntityToJson(AllOrdersEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };
