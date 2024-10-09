// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'login_response_entity.g.dart';

@JsonSerializable()
class SuccessLoginEntity {
  SuccessLoginEntity({
    required this.full_name,
    required this.token,
    // required this.role,
    required this.df_id,
  });

  /// factory.
  factory SuccessLoginEntity.fromJson(Map<String, dynamic> json) =>
      _$SuccessLoginEntityFromJson(json);
  final String full_name;
  final String token;
  final String df_id;
  // final String role;
  // final String role; //! on server this is int
}
