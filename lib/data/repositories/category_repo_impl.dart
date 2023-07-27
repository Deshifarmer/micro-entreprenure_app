import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/category_entity/all_categorys.dart';
import 'package:deshifarmer/domain/repositories/category_response_repo.dart';

class CategoryRepoImpl extends CategoryListRepo {
  final DeshiFarmerAPI _dfAPi = DeshiFarmerAPI();

  @override
  Future<Result<AllCategoryListResp, Exception>> getCategories(String token) {
    return _dfAPi.categoryFetchData(token);
  }
}
