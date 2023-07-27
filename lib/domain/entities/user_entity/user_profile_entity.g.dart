// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileEntity _$UserProfileEntityFromJson(Map<String, dynamic> json) =>
    UserProfileEntity(
      df_id: json['df_id'] as String?,
      full_name: json['full_name'] as String?,
      nid: json['nid'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      designation: json['designation'] as String?,
      previous_designation: json['previous_designation'] as String?,
      previous_company: json['previous_company'] as String?,
      photo: json['photo'] as String?,
      channel: json['channel'] as String?,
      date_of_birth: json['date_of_birth'] as String?,
      present_address: json['present_address'] as String?,
      permanent_address: json['permanent_address'] as String?,
      home_district: json['home_district'] as String?,
      joining_date: json['joining_date'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
      department: json['department'] as String?,
      work_place: json['work_place'] as String?,
      commission: json['commission'] as String?,
      updated_at: json['updated_at'] as String?,
      target_volume: json['target_volume'] as String?,
      account_details: (json['account_details'] as List<dynamic>)
          .map((e) => AccountDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_sale: json['total_sale'] as int,
      total_farmer: json['total_farmer'] as int,
    );

Map<String, dynamic> _$UserProfileEntityToJson(UserProfileEntity instance) =>
    <String, dynamic>{
      'df_id': instance.df_id,
      'full_name': instance.full_name,
      'nid': instance.nid,
      'phone': instance.phone,
      'email': instance.email,
      'designation': instance.designation,
      'previous_designation': instance.previous_designation,
      'previous_company': instance.previous_company,
      'photo': instance.photo,
      'channel': instance.channel,
      'date_of_birth': instance.date_of_birth,
      'present_address': instance.present_address,
      'permanent_address': instance.permanent_address,
      'home_district': instance.home_district,
      'joining_date': instance.joining_date,
      'type': instance.type,
      'gender': instance.gender,
      'department': instance.department,
      'work_place': instance.work_place,
      'commission': instance.commission,
      'updated_at': instance.updated_at,
      'target_volume': instance.target_volume,
      'account_details': instance.account_details,
      'transactions': instance.transactions,
      'total_sale': instance.total_sale,
      'total_farmer': instance.total_farmer,
    };
