// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_link_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmerLinks _$FarmerLinksFromJson(Map<String, dynamic> json) => FarmerLinks(
      first: json['first'] as String?,
      last: json['last'] as String?,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$FarmerLinksToJson(FarmerLinks instance) =>
    <String, dynamic>{
      'first': instance.first,
      'last': instance.last,
      'prev': instance.prev,
      'next': instance.next,
    };
