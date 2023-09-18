// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'farmer_entity_group.g.dart';

@JsonSerializable()
class FarmerEntityGroup {
  const FarmerEntityGroup({
    required this.farmer_id,
    required this.image,
    // required this.farmer_type,
    // required this.onboard_by,
    // required this.nid,
    // required this.gov_farmer_id,
    required this.first_name,
    required this.last_name,
    required this.full_name,
    // required this.fathers_name,
    required this.phone,
    // required this.is_married,
    required this.gender,
    // required this.date_of_birth,
    required this.address,
    // required this.village,
    // required this.upazila,
    // required this.district,
    // required this.division,
    // required this.union,
    // required this.credit_score,
    // required this.residentType,
    // required this.land_status,
    // required this.family_member,
    // required this.number_of_children,
    // required this.yearly_income,
    // required this.year_of_stay_in,
    // required this.group_id,
    // required this.bank_details,
    // required this.mfs_account,
    // required this.current_producing_crop,
    // required this.focused_crop,
    // required this.cropping_intensity,
    // required this.cultivation_practice,
    // required this.farmer_role,
    // required this.farm_id,
    // required this.is_active,
    // required this.onboard_date,
    // required this.order_list,
    // this.farm_list,
    required this.district,
  });

  factory FarmerEntityGroup.fromJson(Map<String, dynamic> json) =>
      _$FarmerEntityGroupFromJson(json);
  final String? farmer_id;
  final String? image;
  // final String? farmer_type;
  // final String? onboard_by;
  // final String? nid;
  // final int? nid; //! for LOCAL
  // final int? gov_farmer_id; //! LOC
  // final String? gov_farmer_id;
  final String? first_name;
  final String? last_name;
  final String? full_name;
  // final String? fathers_name;
  final String? phone;
  final String? district;

  // final String? is_married;
  final String? gender;
  // final String? date_of_birth;
  final String? address;
  // final String? village;
  // final String? upazila;
  // final String? district;
  // final String? division;
  // final String? union;
  // final String? credit_score;
  // final String? residentType;
  // final String? land_status;
  // final String? family_member;
  // final int? family_member; //! for LOCAL
  // final int? number_of_children; //! for LOCAL
  // final String? number_of_children;
  // final int? yearly_income;
  // final String? yearly_income;
  // final String? year_of_stay_in;
  // final String? group_id;
  // final String? bank_details;
  // final String? mfs_account;
  // final String? current_producing_crop;
  // final String? focused_crop;
  // final String? cropping_intensity;
  // final String? cultivation_practice;
  // final String? farmer_role;
  // final String? farm_id;
  // final int? is_active; //! LOCAL
  // final String? is_active;
  // final String? onboard_date;
  // final List<dynamic> order_list;
  // farm_list
  // final List<dynamic>? farm_list;
}
