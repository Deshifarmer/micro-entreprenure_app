// ignore_for_file: one_member_abstracts

import 'package:deshifarmer/core/app_core.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';

/// farmer list repo
abstract class FarmerListRepo {
  Future<Result<AllFarmerListResp, Exception>> getFarmers(String token);
}
