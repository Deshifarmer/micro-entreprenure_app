// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyEntity _$CompanyEntityFromJson(Map<String, dynamic> json) =>
    CompanyEntity(
      total_product: json['total_product'] as int,
      full_name: json['full_name'] as String?,
      df_id: json['df_id'] as String?,
      channel: json['channel'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      status: json['status'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CompanyEntityToJson(CompanyEntity instance) =>
    <String, dynamic>{
      'df_id': instance.df_id,
      'full_name': instance.full_name,
      'phone': instance.phone,
      'status': instance.status,
      'photo': instance.photo,
      'email': instance.email,
      'channel': instance.channel,
      'type': instance.type,
      'total_product': instance.total_product,
    };
