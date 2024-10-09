// ignore_for_file: non_constant_identifier_names, avoid_multiple_declarations_per_line

import 'package:json_annotation/json_annotation.dart';
part 'group_leader_field.g.dart';

/*

"farmer_id": "far-0eb0-3bb13",
"usaid_id": null,
"full_name": "Nadiea test",
"first_name": "Nadiea",
"last_name": "test",
"district": "Manikganj",
"phone": "01914775333",
"gender": "Female",
"address": "dhaka",
"village": "dhaja",
"image": "/image/farmer/far-0eb0-3bb13.jpg",
"farm_area": "5778",
"date_of_birth": "1999-10-09",
"created_at": "2023-09-02T11:13:13.000000Z"

*/
@JsonSerializable()
class GroupLeaderFormField {
  const GroupLeaderFormField({
    required this.farmer_id,
    required this.usaid_id,
    required this.full_name,
    required this.first_name,
    required this.last_name,
    required this.gender,
    required this.district,
    required this.phone,
    required this.address,
    required this.village,
    required this.image,
    required this.farm_area,
    required this.date_of_birth,
    required this.created_at,


  });

  factory GroupLeaderFormField.fromJson(Map<String, dynamic> json) =>
      _$GroupLeaderFormFieldFromJson(json);
  
  final String farmer_id;
  final String? usaid_id;
  final String full_name;
  final String first_name;
  final String last_name;
  final String district;
  final String phone;
  final String gender;
  final String address;
  final String village;
  final String image;
  final String farm_area;
  final String date_of_birth;
  final String created_at;


}
