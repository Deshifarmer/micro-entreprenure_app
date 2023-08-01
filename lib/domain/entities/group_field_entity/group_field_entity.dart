// ignore_for_file: non_constant_identifier_names

/*

    {
        "farmer_group_id": "FG-199d-b1934",
        "farmer_group_name": "মোঃ শামীম হোসেন (কোদালিয়া)",
        "cluster_id": null,
        "isActive": "1",
        "inactive_at": null,
        "group_manager_id": "ME-edcb-a1801",
        "group_leader": null,
        "created_at": "2023-07-30T03:55:34.000000Z",
        "updated_at": "2023-07-30T03:56:52.000000Z",
        "color": null,
        "total_farmers": 25
    }
    

*/

import 'package:deshifarmer/domain/entities/group_field_entity/group_leader_field.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_field_entity.g.dart';

@JsonSerializable()
class GroupFieldEntity {
  const GroupFieldEntity({
    required this.total_farmers,
    required this.color,
    required this.cluster_id,
    required this.created_at,
    required this.farmer_group_id,
    required this.farmer_group_name,
    required this.group_leader,
    required this.group_manager_id,
    required this.isActive,
    required this.updated_at,
  });
  final String farmer_group_id;
  final String farmer_group_name;
  final String? cluster_id;
  final String isActive;
  final String group_manager_id;
  final GroupLeaderFormField? group_leader;
  final String created_at;
  final String updated_at;
  final String? color;
  final int total_farmers;

  factory GroupFieldEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupFieldEntityFromJson(json);
}
