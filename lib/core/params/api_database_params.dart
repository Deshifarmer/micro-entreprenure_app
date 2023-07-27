import 'package:deshifarmer/core/app_strings.dart';

class ApiDatabaseParams {
  ///! login api
  static const loginApi = '${Strings.domain}/api/v1/me/login';

  ///! my profile api
  static const profileApi = '${Strings.domain}/api/v1/me/my_profile';

  ///! add farmer api
  static const addFarmerApi = '${Strings.domain}/api/v1/me/add_farmer';

  ///! my farmer api
  static const myFarmerApi = '${Strings.domain}/api/v1/me/my_farmer';

  ///! inputer order api
  static const inputerOrderApi = '${Strings.domain}/api/v1/me/input_order';

  ///! input order api
  static const orderApi = '${Strings.domain}/api/v1/me/order';

  ///! collect order api
  static const collectOrderApi = '${Strings.domain}/api/v1/me/collect/order';

  ///! Company List api
  static const companyListAPI = '${Strings.domain}/api/v1/all_company';

  ///! cateogry list api
  static const categoryListAPI = '${Strings.domain}/api/v1/all_category';

  ///! Product List api
  static const productListAPI = '${Strings.domain}/api/v1/product/sort';

  ///! Product List api PAGINATION
  static const productListPaginationAPI =
      '${Strings.domain}/api/v1/product/sort?page=';
}
