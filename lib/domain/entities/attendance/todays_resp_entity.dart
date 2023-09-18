// ignore_for_file: non_constant_identifier_names

/* {
    "id": 2,
    "employee_id": "ME-5cbb-0e310",
    "cin_note": null,
    "check_in": "02:29:01 PM",
    "check_out": "02:29:01 PM",
    "cout_note": null
} */

import 'package:json_annotation/json_annotation.dart';

part 'todays_resp_entity.g.dart';

@JsonSerializable()
class TodaysAttendance {
  TodaysAttendance({
    required this.id,
    required this.check_out,
    required this.check_in,
    required this.cin_note,
    required this.employee_id,
    required this.cout_note,
  });

  factory TodaysAttendance.fromJson(Map<String, dynamic> json) =>
      _$TodaysAttendanceFromJson(json);
  final int id;
  final String employee_id;
  final String? cin_note;
  final String? check_in;
  final String? check_out;
  final String? cout_note;
}
