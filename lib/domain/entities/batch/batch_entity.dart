// {
//     "batch_id": "B-e4e8-ab351",
//     "season": "summerX",
//     "farm_id": "Farm-e766-5e048",
//     "which_crop": "yeah? which crop?X",
//     "created_by": "ME-5cbb-0e310"
// }

// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'batch_entity.g.dart';

@JsonSerializable()
class BatchEnity {
  BatchEnity({
    required this.created_by,
    required this.batch_id,
    required this.season,
    required this.farm_id,
    required this.which_crop,
  });

  /// factory.
  factory BatchEnity.fromJson(Map<String, dynamic> json) =>
      _$BatchEnityFromJson(json);

  final String batch_id;
  final String season;
  final String farm_id; // Server
  final String which_crop; // Server
  final String created_by; // Server
}
