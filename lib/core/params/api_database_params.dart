import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';

class ApiDatabaseParams {
  ///! login api
  static String loginApi =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/login';

  ///! logout api
  static String logoutApi =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/logout';

  ///! my profile api
  static String profileApi =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/my_profile';

  ///! add farmer api
  static String addFarmerApi =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/add_farmer';

  ///! my farmer api
  static String myFarmerApi =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/my_farmer';

  ///! inputer order api
  static String inputerOrderApi =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/input_order';

  ///! input order api
  static String orderApi =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/order';

  ///! collect order api
  static String collectOrderApi =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/collect/order';

  ///! Company List api
  static String companyListAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/all_company';

  ///! cateogry list api
  static String categoryListAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/all_category';

  ///! Product List api
  static String productListAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/product/sort';

  ///! Product List api PAGINATION
  static String productListPaginationAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/product/sort?page=';

  ///! Get Groups
  static String getGroupsFormField =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/group';

  ///! Get Groups
  static String getGroupDetailAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/group';

  ///! Unassign Farmers in Group
  static String unassignFarmersApi =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/unassign_farmer';

  ///! Create Group
  static String createGroupAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/create_group';

  ///! Create Farm
  static String farmAddAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/add_farm';

  ///! assign a farmer
  static String assignFarmerToGroup(String groupID) =>
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/farmer_group/$groupID/assign';
  // 'https://core.deshifarmer.co/api/v1/me/farmer_group/FG-10a2-48c21/assign'

  ///! assign a farmer
  static String updateLeaderToGroup(String groupID) =>
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/farmer_group/$groupID';
}
