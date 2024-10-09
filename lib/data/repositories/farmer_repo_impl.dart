import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:deshifarmer/domain/repositories/farmer_response_repo.dart';

class FarmerListImpl extends FarmerListRepo {
  final DeshiFarmerAPI _dfAPi = DeshiFarmerAPI();

  @override
  Future<Result<AllFarmerListRespEntity, Exception>> getFarmers(String token) async {
    return _dfAPi.getFarmers(token);
  }
}
