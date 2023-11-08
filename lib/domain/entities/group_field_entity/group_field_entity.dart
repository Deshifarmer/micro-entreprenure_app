// ignore_for_file: non_constant_identifier_names


import 'package:deshifarmer/domain/entities/group_field_entity/group_leader_field.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_field_entity.g.dart';

@JsonSerializable()
class GroupFieldEntity {
  const GroupFieldEntity({
    required this.total_farmers,
    required this.color,
    required this.cluster_id,
    // required this.created_at,
    required this.farmer_group_id,
    required this.farmer_group_name,
    // required this.group_leader,
    required this.group_manager_id,
    // required this.isActive,
    // required this.is_active,
    required this.member_pic,
    required this.group_leader,
    // required this.updated_at,
  });

  factory GroupFieldEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupFieldEntityFromJson(json);
  final String farmer_group_id;
  final String farmer_group_name;
  final String? cluster_id;
  // final int isActive; //! for LOCAL
  // final String isActive;
  final String group_manager_id;
  final GroupLeaderFormField? group_leader;
  // final FarmerEntity? group_leader;
  // final String created_at;
  // final String updated_at;
  final String? color;
  final int total_farmers;
  final List<dynamic> member_pic;
  // final String total_farmers; //! for LOCAL
}
