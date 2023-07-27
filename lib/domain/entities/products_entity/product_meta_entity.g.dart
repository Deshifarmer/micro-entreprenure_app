// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_meta_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMeta _$ProductMetaFromJson(Map<String, dynamic> json) => ProductMeta(
      links: (json['links'] as List<dynamic>)
          .map((e) => ProductMetaLinks.fromJson(e as Map<String, dynamic>))
          .toList(),
      current_page: json['current_page'] as String?,
      form: json['form'] as int,
      last_page: json['last_page'] as int,
      path: json['path'] as String?,
      per_page: json['per_page'] as int,
      to: json['to'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$ProductMetaToJson(ProductMeta instance) =>
    <String, dynamic>{
      'current_page': instance.current_page,
      'form': instance.form,
      'last_page': instance.last_page,
      'path': instance.path,
      'per_page': instance.per_page,
      'to': instance.to,
      'total': instance.total,
      'links': instance.links,
    };
