import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/domain/repositories/farmer_group_repo.dart';

class FarmarGroupFieldImpl extends FarmarGroupFieldResponseRepo {
  final DeshiFarmerAPI _dfAPi = DeshiFarmerAPI();
  @override
  Future<Result<AllFarmerGroupFieldResp, Exception>> getFarmersGroup(
      String token) {
    return _dfAPi.getGroupFields(token);
  }
}
