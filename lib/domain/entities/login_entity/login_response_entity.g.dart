// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessLoginEntity _$SuccessLoginEntityFromJson(Map<String, dynamic> json) =>
    SuccessLoginEntity(
      full_name: json['full_name'] as String,
      token: json['token'] as String,
      role: json['role'] as int,
      df_id: json['df_id'] as String,
    );

Map<String, dynamic> _$SuccessLoginEntityToJson(SuccessLoginEntity instance) =>
    <String, dynamic>{
      'full_name': instance.full_name,
      'token': instance.token,
      'df_id': instance.df_id,
      'role': instance.role,
    };
