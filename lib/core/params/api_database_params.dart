import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/utils/secrets_.dart';
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
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/collect_order/';

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

  ///! attendance api (check in/out api)
  static String checkinAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/attendance';

  ///! attendance api (todays attendanc3)
  static String todaysAttendanceAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/todays_attendance';

  ///! attendance api (todays attendanc3)
  static String attendanceHistory =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/attendance_history';

  /// comission aka (all transaction)
  static String comissionAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/all_transaction';
  static String getCurrentWeatherURL(
    String lat,
    String lon,
  ) =>
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$weatherAPIKey&units=metric';

  /// batch creation api
  static String batchCreationAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/batch'; //*POST
  //! get batch list api
  static String batchListAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/farm_batch'; //*GET

  //! post a harvest
  static String harvestPostAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/sourcing'; //*POST

  //! get all harvest
  static String harvestGetAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/my_sourcing'; //*GET

  ///* get landprep
  static String harvestLandPrepPost =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/land_preparation'; //*POST
  ///* get sowing
  static String harvestSowingPost =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/sowing'; //*POST

  ///* get watering/irriagtion
  static String irrigationPost =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/watering'; //*POST
  //* get; fertilization
  static String fertilizationPost =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/fertilization'; //*POST
  //* get pesticide
  static String pesticidePost =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/pesticide'; //*POST

  //! get latest batch list api
  static String latestbatchListAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/my_batch'; //*GET

  //! get batch Info
  static String getBatchInfo =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/batch'; //*GET

  //! get post Logistic api
  static String postLogisticAPI =
      '${Strings.getServerOrLocal(ServerOrLocal.server)}/api/v1/me/logistic'; //*POST
}
