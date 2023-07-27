// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyEntity _$CompanyEntityFromJson(Map<String, dynamic> json) =>
    CompanyEntity(
      full_name: json['full_name'] as String?,
      df_id: json['df_id'] as String?,
      channel: json['channel'] as String?,
      date_of_birth: json['date_of_birth'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      home_district: json['home_district'] as String?,
      joining_date: json['joining_date'] as String?,
      nid: json['nid'] as String?,
      permanent_address: json['permanent_address'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      present_address: json['present_address'] as String?,
      product_list: (json['product_list'] as List<dynamic>)
          .map((e) => ProductListEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      type: json['type'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CompanyEntityToJson(CompanyEntity instance) =>
    <String, dynamic>{
      'df_id': instance.df_id,
      'full_name': instance.full_name,
      'phone': instance.phone,
      'status': instance.status,
      'updated_at': instance.updated_at,
      'gender': instance.gender,
      'joining_date': instance.joining_date,
      'home_district': instance.home_district,
      'permanent_address': instance.permanent_address,
      'present_address': instance.present_address,
      'photo': instance.photo,
      'email': instance.email,
      'nid': instance.nid,
      'channel': instance.channel,
      'date_of_birth': instance.date_of_birth,
      'type': instance.type,
      'product_list': instance.product_list,
    };
