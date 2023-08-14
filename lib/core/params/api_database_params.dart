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

  ///! Get Groups
  static const getGroupsFormField = '${Strings.domain}/api/v1/me/group';

  ///! Get Groups
  static const getGroupDetailAPI = '${Strings.domain}/api/v1/me/group';

  ///! Unassign Farmers in Group
  static const unassignFarmersApi =
      '${Strings.domain}/api/v1/me/unassign_farmer';

  ///! Create Group
  static const createGroupAPI = '${Strings.domain}/api/v1/me/create_group';

  ///! Create Farm
  static const farmAddAPI = '${Strings.domain}/api/v1/me/add_farm';

  ///! assign a farmer
  static String assignFarmerToGroup(String groupID) =>
      '${Strings.domain}/api/v1/me/farmer_group/$groupID/assign';
  // 'https://core.deshifarmer.co/api/v1/me/farmer_group/FG-10a2-48c21/assign'

  ///! assign a farmer
  static String updateLeaderToGroup(String groupID) =>
      '${Strings.domain}/api/v1/me/farmer_group/$groupID';
}
