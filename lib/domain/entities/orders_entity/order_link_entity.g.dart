// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_link_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderLinks _$OrderLinksFromJson(Map<String, dynamic> json) => OrderLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$OrderLinksToJson(OrderLinks instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };
