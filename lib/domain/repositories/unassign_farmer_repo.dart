// ignore_for_file: one_member_abstracts

import 'package:deshifarmer/core/app_core.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';

abstract class UnassignFarmerListRepo {
  Future<Result<AllFarmerListResp, Exception>> getUnassignFarmers(String token);
}
