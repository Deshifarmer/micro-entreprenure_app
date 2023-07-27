import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/company_entity/all_company_entity.dart';
import 'package:deshifarmer/domain/entities/company_entity/company_response_entity.dart';
import 'package:deshifarmer/domain/repositories/company_response_repo.dart';

class CompanyListImpl extends CompanyResponseResponseRepo {
  final DeshiFarmerAPI _dfAPi = DeshiFarmerAPI();

  @override
  Future<Result<AllCompanyListResp, Exception>> getCompanies(
    String token,
  ) async {
    return _dfAPi.companyFetchData(token);
  }
}
