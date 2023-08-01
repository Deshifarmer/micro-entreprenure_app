// ignore_for_file: one_member_abstracts

import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/domain/entities/company_entity/all_company_entity.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';

/// ShortUrlRepository
abstract class FarmarGroupFieldResponseRepo {
  Future<Result<AllFarmerGroupFieldResp, Exception>> getFarmersGroup(
    String token,
  );
}
