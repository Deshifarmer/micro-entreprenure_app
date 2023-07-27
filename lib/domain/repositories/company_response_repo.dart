// ignore_for_file: one_member_abstracts

import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/domain/entities/company_entity/all_company_entity.dart';

/// ShortUrlRepository
abstract class CompanyResponseResponseRepo {
  Future<Result<AllCompanyListResp, Exception>> getCompanies(String token);
}
