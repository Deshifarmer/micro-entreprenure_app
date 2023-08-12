// ignore_for_file: non_constant_identifier_names

import 'package:deshifarmer/domain/entities/user_entity/account_detail_entity.dart';
import 'package:deshifarmer/domain/entities/user_entity/transaction_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_profile_entity.g.dart';

@JsonSerializable()
class UserProfileEntity {
  const UserProfileEntity({
    required this.df_id,
    required this.full_name,
    required this.nid,
    required this.phone,
    required this.email,
    required this.designation,
    required this.previous_designation,
    required this.previous_company,
    required this.photo,
    required this.channel,
    required this.date_of_birth,
    required this.present_address,
    required this.permanent_address,
    required this.home_district,
    required this.joining_date,
    required this.type,
    required this.gender,
    required this.department,
    required this.work_place,
    required this.commission,
    required this.updated_at,
    required this.target_volume,
    required this.account_details,
    required this.transactions,
    required this.total_sale,
    required this.total_farmer,
  });
  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$UserProfileEntityFromJson(json);
  final String? df_id;
  final String? full_name;
  // final String nid;
  final int nid; //! on local its INT
  final String? phone;
  final String? email;
  final String? designation;
  final String? previous_designation;
  final String? previous_company;
  final String? photo;
  final String? channel;
  final String? date_of_birth;
  final String? present_address;
  final String? permanent_address;
  final String? home_district;
  final String? joining_date;
  // final String? type;
  final int? type; //! on local its int
  final String? gender;
  final String? department;
  final String? work_place;
  final String? commission;
  final String? updated_at;
  final String? target_volume;
  final List<AccountDetail> account_details;
  final List<Transaction> transactions;
  final int total_sale;
  final int total_farmer;
}
