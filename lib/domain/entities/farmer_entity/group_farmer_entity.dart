// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'group_farmer_entity.g.dart';

@JsonSerializable()
class GroupFarmerEntity {
  const GroupFarmerEntity({
    required this.farmer_id,
    required this.image,
    required this.usaid_id,
    required this.farm_area,

    // required this.gov_farmer_id,
    required this.first_name,
    required this.last_name,
    required this.full_name,
    // required this.fathers_name,
    required this.phone,
    // required this.is_married,
    required this.gender,
    required this.date_of_birth,
    required this.address,
    required this.village,
    // required this.upazila,
    required this.district,
  });

  factory GroupFarmerEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupFarmerEntityFromJson(json);
  final String? farmer_id;
  final String? usaid_id;
  final String? full_name;
  final String? first_name;
  final String? last_name;
  final String? district;
  final String? phone;
  final String? gender;
  final String? village;
  final String? address;
  final String? image;
  final String? farm_area;
  final String? date_of_birth;
}
