// ignore_for_file: one_member_abstracts

import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/domain/entities/company_entity/all_company_entity.dart';

import '../entities/category_entity/all_categorys.dart';

/// ShortUrlRepository
abstract class CategoryListRepo {
  Future<Result<AllCategoryListResp, Exception>> getCategories(String token);
}
