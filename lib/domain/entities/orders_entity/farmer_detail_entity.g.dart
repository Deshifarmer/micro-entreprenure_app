// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmer_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FarmerDetailEntity _$FarmerDetailEntityFromJson(Map<String, dynamic> json) =>
    FarmerDetailEntity(
      farmer_name: json['farmer_name'] as String?,
      farmer_phone: json['farmer_phone'] as String?,
      farmer_address: json['farmer_address'] as String?,
    );

Map<String, dynamic> _$FarmerDetailEntityToJson(FarmerDetailEntity instance) =>
    <String, dynamic>{
      'farmer_name': instance.farmer_name,
      'farmer_phone': instance.farmer_phone,
      'farmer_address': instance.farmer_address,
    };
