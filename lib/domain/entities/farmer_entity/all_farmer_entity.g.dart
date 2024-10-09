// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_farmer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFarmerListRespEntity _$AllFarmerListRespEntityFromJson(
        Map<String, dynamic> json) =>
    AllFarmerListRespEntity(
      data: (json['data'] as List<dynamic>)
          .map((e) => FarmerEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : FarmerLinks.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : FarmerMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AllFarmerListRespEntityToJson(
        AllFarmerListRespEntity instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
    };
