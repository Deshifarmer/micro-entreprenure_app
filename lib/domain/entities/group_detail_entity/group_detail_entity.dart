// ignore_for_file: non_constant_identifier_names

import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/group_leader_field.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_detail_entity.g.dart';

@JsonSerializable()
class GroupDetailEntity {
  GroupDetailEntity({
    required this.cluster_id,
    required this.color,
    required this.created_at,
    required this.farmer_group_id,
    required this.farmer_group_name,
    required this.farmer_list,
    // required this.group_leader,
    required this.group_manager_id,
    required this.inactive_at,
    required this.isActive,
    required this.total_farmers,
    required this.updated_at,
  });

  factory GroupDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupDetailEntityFromJson(json);
  final String? farmer_group_id;
  final String? farmer_group_name;
  final String? cluster_id;
  final int? isActive;
  // final String? isActive;
  final String? inactive_at;
  final String? group_manager_id;
  final String? created_at;
  final String? updated_at;
  final String? color;
  final int? total_farmers;
  // final String? total_farmers;
  // final GroupLeaderFormField? group_leader;
  final List<FarmerEntity?> farmer_list;
}
