// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderMeta _$OrderMetaFromJson(Map<String, dynamic> json) => OrderMeta(
      links: (json['links'] as List<dynamic>)
          .map((e) => ProductMetaLinks.fromJson(e as Map<String, dynamic>))
          .toList(),
      current_page: (json['current_page'] as num?)?.toInt(),
      form: (json['form'] as num?)?.toInt(),
      last_page: (json['last_page'] as num?)?.toInt(),
      path: json['path'] as String?,
      per_page: (json['per_page'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderMetaToJson(OrderMeta instance) => <String, dynamic>{
      'current_page': instance.current_page,
      'form': instance.form,
      'last_page': instance.last_page,
      'path': instance.path,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'links': instance.links,
    };
