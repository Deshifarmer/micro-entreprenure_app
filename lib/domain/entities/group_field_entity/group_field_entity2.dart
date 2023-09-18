// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'group_field_entity2.g.dart';

@JsonSerializable()
class GroupFieldEntity2 {
  const GroupFieldEntity2({
    required this.total_farmers,
    required this.color,
    required this.cluster_id,
    required this.created_at,
    required this.farmer_group_id,
    required this.farmer_group_name,
    // required this.group_leader,
    required this.group_manager_id,
    required this.isActive,
    // required this.is_active,
    required this.updated_at,
  });

  factory GroupFieldEntity2.fromJson(Map<String, dynamic> json) =>
      _$GroupFieldEntity2FromJson(json);
  final String farmer_group_id;
  final String farmer_group_name;
  final String? cluster_id;
  // final int isActive; //! for LOCAL
  final String isActive;
  final String group_manager_id;
  // final GroupLeaderFormField? group_leader;
  // final FarmerEntity? group_leader;
  final String created_at;
  final String updated_at;
  final String? color;
  final int total_farmers;
  // final String total_farmers; //! for LOCAL
}
