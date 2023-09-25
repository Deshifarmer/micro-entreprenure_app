// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_links_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductLinks _$ProductLinksFromJson(Map<String, dynamic> json) => ProductLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
      next: json['next'] as int?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$ProductLinksToJson(ProductLinks instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };
