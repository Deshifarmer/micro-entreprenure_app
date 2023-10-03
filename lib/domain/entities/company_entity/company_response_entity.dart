// ignore_for_file: non_constant_identifier_names, avoid_multiple_declarations_per_line

import 'package:json_annotation/json_annotation.dart';
part 'company_response_entity.g.dart';

// ignore: duplicate_ignore
@JsonSerializable()
class CompanyEntity {
  CompanyEntity({
    required this.total_product,
    required this.full_name,
    required this.df_id,
    required this.channel,
    // required this.date_of_birth,
    required this.email,
    // required this.gender,
    // required this.home_district,
    // required this.joining_date,
    // required this.nid,
    // required this.permanent_address,
    required this.phone,
    required this.photo,
    // required this.present_address,
    // required this.product_list,
    required this.status,
    // required this.type,
    // required this.updated_at,
  });

  /// factory.
  factory CompanyEntity.fromJson(Map<String, dynamic> json) =>
      _$CompanyEntityFromJson(json);

  final String? df_id,
      full_name,
      phone,
      status,
      // updated_at,
      // gender,
      // joining_date,
      // home_district,
      // permanent_address,
      // present_address,
      photo,
      email;
  // final String? nid;
  final String? channel;
  // final String? date_of_birth;
  // final String? type;
  // final List<ProductListEntity> product_list;
  final int total_product;
}
