// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_meta_links_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMetaLinks _$ProductMetaLinksFromJson(Map<String, dynamic> json) =>
    ProductMetaLinks(
      active: json['active'] as bool?,
      label: json['label'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ProductMetaLinksToJson(ProductMetaLinks instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
