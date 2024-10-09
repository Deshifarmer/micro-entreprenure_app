import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:deshifarmer/domain/repositories/unassign_farmer_repo.dart';

class UnassignFarmerListImpl extends UnassignFarmerListRepo {
  final DeshiFarmerAPI _dfAPi = DeshiFarmerAPI();

  @override
  Future<Result<AllFarmerListRespEntity, Exception>> getUnassignFarmers(
    String token,
  ) async {
    return _dfAPi.getUnassingFarmers(token);
  }
}
