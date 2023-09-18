// AttendaceHistoryEntity

// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'att_history.g.dart';

@JsonSerializable()
class AttendaceHistoryEntity {
  AttendaceHistoryEntity({
    required this.date,
    required this.work_hour,
  });
  final String date;
  final String work_hour;

  /// factory.
  factory AttendaceHistoryEntity.fromJson(Map<String, dynamic> json) =>
      _$AttendaceHistoryEntityFromJson(json);
}
