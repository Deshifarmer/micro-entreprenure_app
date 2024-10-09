// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'activity_famer_detail.g.dart';

@JsonSerializable()
class ActivityFarmerDetails {
  ActivityFarmerDetails({
    required this.image,
    required this.phone,
    required this.full_name,
  });

  /// factory.
  factory ActivityFarmerDetails.fromJson(Map<String, dynamic> json) =>
      _$ActivityFarmerDetailsFromJson(json);

  final String full_name;
  final String phone;
  final String image;
}
