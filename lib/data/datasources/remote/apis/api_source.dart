// ignore_for_file: omit_local_variable_types, prefer_final_locals

import 'dart:convert';
import 'dart:isolate';

import 'package:deshifarmer/core/app_core.dart';
import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/data/models/add_farm_model.dart';
import 'package:deshifarmer/data/models/add_farmer_model.dart';
import 'package:deshifarmer/data/models/order_model.dart';
import 'package:deshifarmer/domain/entities/category_entity/all_categorys.dart';
import 'package:deshifarmer/domain/entities/category_entity/category_entity.dart';
import 'package:deshifarmer/domain/entities/company_entity/all_company_entity.dart';
import 'package:deshifarmer/domain/entities/company_entity/company_response_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/domain/entities/group_detail_entity/group_detail_entity.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/group_field_entity.dart';
import 'package:deshifarmer/domain/entities/login_entity/login_response_entity.dart';
import 'package:deshifarmer/domain/entities/orders_entity/all_orders.dart';
import 'package:deshifarmer/domain/entities/orders_entity/order_response_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_entity.dart';
import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:http/http.dart' as http;

class DeshiFarmerAPI {
  final Map<String, String> _headers = <String, String>{
    'Accept': 'application/json',
    // 'Authorization': 'Bearer ${ApiKeys.urlBayToken}',
  };

  ///! User LOGIN
  Future<Result<SuccessLoginEntity, Exception>> userLogin(
    String mail,
    String pass,
  ) async {
    final Uri url = Uri.parse(
      '${ApiDatabaseParams.loginApi}?email=$mail&password=$pass',
    );
    print('url -> $url $mail $pass');
    try {
      final http.Response response = await http.post(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        final result = await Isolate.run(() => json.decode(response.body));
        print(result);
        try {
          SuccessLoginEntity successResonse =
              SuccessLoginEntity.fromJson(result as Map<String, dynamic>);

          return Success<SuccessLoginEntity, Exception>(successResonse);
        } catch (e) {
          print('Converting error -> $e');
          return ServerFailor<SuccessLoginEntity, Exception>(
            Exception('Server failor'),
          );
        }
        // return ServerFailor<SuccessLoginEntity, Exception>(
        //   Exception('Server failor'),
        // );
      } else {
        print('${response.statusCode} ${response.body}');
        // print(response.)
        return ServerFailor<SuccessLoginEntity, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<SuccessLoginEntity, Exception>(
        Exception('Server failor'),
      );
    }
  }

  ///! User LOGOUT
  Future<bool> userLogout(String token) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.logoutApi,
    );

    /// do a post request
    print('logout url -> $url $token');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.post(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        print("${response.statusCode} | ${response.body}");
        return true;
      } else {
        print("${response.statusCode} | ${response.body}");
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  ///! User ORDERS
  Future<Result<AllOrdersEntity, Exception>> userOrder(
    String token,
  ) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.orderApi,
    );
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        final result = json.decode(response.body) as List<dynamic>;
        print('result -> $result');
        List<OrderEntity> orderEntitys = [];
        for (int i = 0; i < result.length; i++) {
          final element = result[i];
          try {
            orderEntitys.add(
              OrderEntity.fromJson(element as Map<String, dynamic>),
            );
            print('entity added successfully -> $i');
          } catch (e) {
            final result2 = element as Map<String, dynamic>;
            result2.forEach((key, value) {
              print('$key $value ${value.runtimeType}');
            });
          }
        }
        AllOrdersEntity successResonse = AllOrdersEntity(orderEntitys);

        return Success<AllOrdersEntity, Exception>(successResonse);
      } else {
        print(response.statusCode);

        return ServerFailor<AllOrdersEntity, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<AllOrdersEntity, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! User Profile
  Future<Result<UserProfileEntity, Exception>> userProfile(
    String token,
  ) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.profileApi,
    );
    try {
      print('trying..................');
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      print('url -> $url $token');
      if (response.statusCode == 200) {
        print('status 200');
        final result = await Isolate.run(() => json.decode(response.body))
            as Map<String, dynamic>;
        try {
          UserProfileEntity successResonse = UserProfileEntity.fromJson(result);
          return Success<UserProfileEntity, Exception>(successResonse);
        } catch (e) {
          print('exception occured $e');
          result.forEach(
            (key, value) {
              print('$key ${value.runtimeType} $value');
            },
          );
          return ServerFailor<UserProfileEntity, Exception>(
            Exception('Server failor'),
          );
        }
      } else {
        print('status CODE -> ${response.statusCode}');
        return ServerFailor<UserProfileEntity, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      print('an exception occured -> $e');
      return ServerFailor<UserProfileEntity, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///*--------------------------------------------------------------*////

  ///! Company fetch data
  Future<Result<AllCompanyListResp, Exception>> companyFetchData(
    String token,
  ) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.companyListAPI,
    );
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as List<dynamic>;
        List<CompanyEntity> companyE = [];
        for (int i = 0; i < result.length; i++) {
          final element = result[i];
          try {
            companyE.add(
              CompanyEntity.fromJson(element as Map<String, dynamic>),
            );
          } catch (e) {
            print('error comverting data ->  ${element.runtimeType}, $e');
            final e2 = element as Map<String, dynamic>;
            e2.forEach((key, value) {
              print('${value.runtimeType} $key $value');
            });
          }
        }
        AllCompanyListResp successResonse = AllCompanyListResp(companyE);

        return Success<AllCompanyListResp, Exception>(successResonse);
      } else {
        return ServerFailor<AllCompanyListResp, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<AllCompanyListResp, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! Category fetch data
  Future<Result<AllCategoryListResp, Exception>> categoryFetchData(
    String token,
  ) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.categoryListAPI,
    );
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as List<dynamic>;
        List<CategoryEntity> companyE = [];
        for (int i = 0; i < result.length; i++) {
          final element = result[i];
          try {
            companyE.add(
              CategoryEntity.fromJson(element as Map<String, dynamic>),
            );
          } catch (e) {
            print('error comverting data ->  ${element.runtimeType}, $e');
            final e2 = element as Map<String, dynamic>;
            e2.forEach((key, value) {
              print('${value.runtimeType} $key $value');
            });
          }
        }
        AllCategoryListResp successResonse = AllCategoryListResp(companyE);

        return Success<AllCategoryListResp, Exception>(successResonse);
      } else {
        return ServerFailor<AllCategoryListResp, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<AllCategoryListResp, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///*-------------------------------------------------------------*///
  ///! get PRODUCTS [DO NOT MODIFY THE ABOVE CONTENT]
  ///!(DANGER)
  ///!(DANGER)
  ///!(DANGER)

  ///! get PRODUCTS (DONOTEDIT)
  Future<Result<ProductEntity, Exception>> getProducts(String token) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.productListAPI,
    );
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        final result = json.decode(response.body) as Map<String, dynamic>;
        try {
          ProductEntity successResonse = ProductEntity.fromJson(result);
          return Success<ProductEntity, Exception>(successResonse);
        } catch (e) {
          print('error -> $e');
          result.forEach((key, value) {
            print('${value.runtimeType} $key ${value["name"]}');
          });
        }
        return ServerFailor<ProductEntity, Exception>(
          Exception('Server failor'),
        );
      } else {
        print('not a status code : ${response.statusCode}');
        return ServerFailor<ProductEntity, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<ProductEntity, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! Get Product Paginate
  Future<Result<ProductEntity, Exception>> getProductsPaginate(
    String token,
    int page,
  ) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      '${ApiDatabaseParams.productListPaginationAPI}$page',
    );
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        final result = json.decode(response.body) as Map<String, dynamic>;
        try {
          ProductEntity successResonse = ProductEntity.fromJson(result);
          print('${ApiDatabaseParams.productListPaginationAPI}$page');
          print('returing the success paginated result $page');
          return Success<ProductEntity, Exception>(successResonse);
        } catch (e) {
          print('error -> $e');
          result.forEach((key, value) {
            print('${value.runtimeType} $key ${value["name"]}');
          });
        }
        return ServerFailor<ProductEntity, Exception>(
          Exception('Server failor'),
        );
      } else {
        print('status code : ${response.statusCode}');
        return ServerFailor<ProductEntity, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<ProductEntity, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! DO NOT MODIFY THE ABOVE CONTENT (DANGER)
  ///*-------------------------------------------------------------*///
  ///
  ///* Get the Farmer LIST
  Future<Result<AllFarmerListResp, Exception>> getFarmers(String token) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.myFarmerApi,
    );
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as List<dynamic>;
        print(
          'successfuly got the result -> ${result.runtimeType} ${result.length}',
        );
        List<FarmerEntity> companyE = [];
        for (int i = 0; i < result.length; i++) {
          final element = result[i] as Map<String, dynamic>;
          // print('element runtime -> ${element.runtimeType}');
          try {
            companyE.add(
              FarmerEntity.fromJson(element),
            );
          } catch (e) {
            print('error comverting data ->  ${element.runtimeType}, $e \n');
            // e2.forEach((key, value) {
            //   if (value.runtimeType != String) {
            //     print('${value.runtimeType} $key $value');
            //   }
            // });

            final e2 = element;
            print('exception occured $e');
            e2.forEach(
              (key, value) {
                print('$key | ${value.runtimeType} | $value');
              },
            );
          }
        }
        AllFarmerListResp successResonse = AllFarmerListResp(companyE);

        return Success<AllFarmerListResp, Exception>(successResonse);
      } else {
        return ServerFailor<AllFarmerListResp, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<AllFarmerListResp, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///* Get the Unassign Farmer LIST
  Future<Result<AllFarmerListResp, Exception>> getUnassingFarmers(
    String token,
  ) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.unassignFarmersApi,
    );
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as List<dynamic>;
        print(
          'successfuly got the Unassing LISTO -> ${result.runtimeType} ${result.length}',
        );
        List<FarmerEntity> companyE = [];
        for (int i = 0; i < result.length; i++) {
          final element = result[i] as Map<String, dynamic>;
          // print('element runtime -> ${element.runtimeType}');
          try {
            companyE.add(
              FarmerEntity.fromJson(element),
            );
          } catch (e) {
            print(
              'error comverting List<FarmerEntity> ->  ${element.runtimeType}, $e \n',
            );
            final e2 = element;
            e2.forEach((key, value) {
              if (value.runtimeType != String) {
                print('${value.runtimeType} $key $value');
              }
            });
          }
        }
        AllFarmerListResp successResonse = AllFarmerListResp(companyE);

        return Success<AllFarmerListResp, Exception>(successResonse);
      } else {
        return ServerFailor<AllFarmerListResp, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<AllFarmerListResp, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///*-------------------------------------------------------------*///
  ///
  ///* Get Group Field LIST
  Future<Result<AllFarmerGroupFieldResp, Exception>> getGroupFields(
    String token,
  ) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.getGroupsFormField,
    );
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as List<dynamic>;
        print(
          'successfuly Unassign GROUPs -> ${result.runtimeType} ${result.length}',
        );
        List<GroupFieldEntity> companyE = [];
        for (int i = 0; i < result.length; i++) {
          final element = result[i] as Map<String, dynamic>;
          // print('element runtime -> ${element.runtimeType}');
          try {
            companyE.add(
              GroupFieldEntity.fromJson(element),
            );
          } catch (e) {
            print(
              'error comverting data Unassing GroupFieldEntity ->  ${element.runtimeType}, $e \n',
            );
// getFarmersGroup
            final e2 = element;
            e2.forEach((key, value) {
              if (value.runtimeType != String) {
                print('${value.runtimeType} $key $value');
              }
            });
          }
        }
        AllFarmerGroupFieldResp successResonse =
            AllFarmerGroupFieldResp(companyE);

        return Success<AllFarmerGroupFieldResp, Exception>(successResonse);
      } else {
        return ServerFailor<AllFarmerGroupFieldResp, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<AllFarmerGroupFieldResp, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! Get groupo Details from api
  Future<Result<GroupDetailEntity, Exception>> getGroupDetails(
    String token,
    String groupID,
  ) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      '${ApiDatabaseParams.getGroupDetailAPI}/$groupID',
    );
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      print('toekn $token \n groupid -> $groupID');
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as Map<String, dynamic>;
        print(
          'successfuly got GROUP detail -> ${result.runtimeType} ${result.length}',
        );

        try {
          GroupDetailEntity successResonse = GroupDetailEntity.fromJson(result);
          // GroupDetailEntity successResonse = GroupDetailEntity.fromJson(result);

          return Success<GroupDetailEntity, Exception>(successResonse);
        } catch (e) {
          print('got error converting to model $e');

          result.forEach((key, value) {
            print('$key ${key.runtimeType} $value');
          });

          return ServerFailor<GroupDetailEntity, Exception>(
            Exception('Converting Data Erro -> $e'),
          );
        }
      } else {
        return ServerFailor<GroupDetailEntity, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<GroupDetailEntity, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! * ------------------------- POST METHODS -----------------------
  ///
  /// adding Farmers
  Future<Result<bool, Exception>> addFarmer(
    AddFarmerModel farmerModel,
    String token,
  ) async {
    // var checkIfGovtID = {};
    ///! POST BODY

    var d = farmerModel.focusedCrop
        ?.replaceAll('{', '')
        .replaceAll('}', '')
        .split(',');
    var focusedCorpFormat = {
      'cropname': d,
    };
    print(d);

    var d2 = farmerModel.currentProducingCrop
        ?.replaceAll('{', '')
        .replaceAll('}', '')
        .split(',');
    var currentCorpFormat = {
      'cropname': d2,
    };
    print(d2);
    Map<String, String> body = <String, String>{
      'farmer_type': '1',
      // 'onboard_by': farmerModel.onboardBy ?? '', //! NOT NEEDED
      'nid': farmerModel.nid,
      // 'gov_farmer_id': farmerModel.govtFarmerID.toString(), //? check if govt id or DO NOT ADD THE FIELD
      'first_name': farmerModel.firstName,
      'last_name': farmerModel.lastName,
      'fathers_name': farmerModel.fathersName,
      'phone': farmerModel.phone,
      'is_married': farmerModel.isMarried,
      'gender': farmerModel.gender,
      // 'date_of_birth':
      //     '${farmerModel.dateOfBirth.year}-${farmerModel.dateOfBirth.year}-${farmerModel.dateOfBirth.year}',
      'date_of_birth': '1999-10-09',
      'address': farmerModel.address,
      'village': farmerModel.village,
      'union': farmerModel.union,
      'upazila': farmerModel.upazila,
      'district': farmerModel.district,
      'division': farmerModel.division,
      // 'resident_type': 'Rental', //* OWN/Rental
      'resident_type': farmerModel.residentType, //* OWN/Rental
      'family_member': farmerModel.familyMember,
      'number_of_children': farmerModel.numberOfChildren,
      'yearly_income': farmerModel.yearlyIncome,
      'group_id': farmerModel.groupId.toString(),
      'farm_area': farmerModel.farmArea.toString(),
      'farm_type': farmerModel.farmType.toString(),
      // 'bank_details': json.encode(farmerModel.bankDetails), //JSON
      // 'mfs_account': json.encode(farmerModel.mfsAccount), // JSON
      'current_producing_crop': json.encode(currentCorpFormat), // JSON
      'focused_crop': json.encode(focusedCorpFormat), // JSON
      // 'farm_id': farmerModel.farmId.toString(),
      'year_of_stay_in': farmerModel.yearOfStayIn,
    };
    var bDetail = farmerModel.bankDetails! as Map<String, String>;
    if (bDetail['bank_name']!.isNotEmpty &&
        bDetail['branch_name']!.isNotEmpty &&
        bDetail['account_number']!.isNotEmpty) {
      body['bank_details'] = json.encode(farmerModel.bankDetails); //JSON
      print('bank detail -> ${json.encode(farmerModel.bankDetails)}');
    }
    var msfDetail = farmerModel.mfsAccount! as Map<String, String>;

    if (msfDetail['mfs_type']!.isNotEmpty &&
        msfDetail['mfs_account']!.isNotEmpty) {
      // 'mfs_account': json.encode(farmerModel.mfsAccount), // JSON
      body['mfs_account'] = json.encode(farmerModel.mfsAccount); //JSON
      print('msf account -> ${json.encode(farmerModel.mfsAccount)}');
    }

    // print(
    //     'focused crop -> ${json.encode({'cropname':${_d.runtimeType} ${_d})}');
    // print('-d -> ${json.encode(fFor)}');

    // print(
    //     'beauty -> ${farmerModel.focusedCrop?.replaceAll("{", "").replaceAll("}", "").split(" ")}');

    ///! POST HEADER
    Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    print('token from API -> $token');

    ///! url to URI
    final Uri url = Uri.parse(
      ApiDatabaseParams.addFarmerApi,
      // 'https://core.deshifarmer.co/api/v1/me/add_farmer'
    );

    ///! Trying request to SErVER
    try {
      _headers.addAll(headers);
      var request = http.MultipartRequest('POST', url);
      // print('image path from API -> ${farmerModel.image}');
      // print('dob -> ${body["date_of_birth"]}');
      request.fields.addAll(body);

      request.files
          .add(await http.MultipartFile.fromPath('image', farmerModel.image!));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(
          'server success resp -> 201 -> ${response.reasonPhrase} ${await response.stream.bytesToString()}',
        );

        return Success<bool, Exception>(true);
      } else {
        var respMsg = await response.stream.bytesToString();
        print(
          'server resp -> ${response.statusCode}\n$respMsg',
        );

        print(
          'message -> ${jsonDecode(respMsg)["message"]}',
        );
        return ServerFailor<bool, Exception>(
          Exception(jsonDecode(respMsg)['message']),
        );
      }
    } catch (e) {
      print('Unknown Errors -> $e');
      return ServerFailor<bool, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  /// Create Group API

  Future<Result<bool, Exception>> createGroup(
    String token,
    String groupName,
    String groupLeaderID,
  ) async {
    // var checkIfGovtID = {};
    ///! POST BODY
    Map<String, String> body = <String, String>{
      'farmer_group_name': groupName,
      // 'onboard_by': farmerModel.onboardBy ?? '', //! NOT NEEDED
      'group_leader': groupLeaderID,
    };

    ///! POST HEADER
    Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    print('token from API -> $token');

    ///! url to URI
    final Uri url = Uri.parse(
      ApiDatabaseParams.createGroupAPI,
    );

    ///! Trying request to SErVER
    try {
      _headers.addAll(headers);
      var request = http.MultipartRequest('POST', url);
      request.fields.addAll(body);

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(
          'server success resp -> 201 -> ${response.reasonPhrase} ${await response.stream.bytesToString()}',
        );

        return Success<bool, Exception>(true);
      } else {
        print(
          'server resp -> ${response.statusCode}\n${response.reasonPhrase} ${await response.stream.bytesToString()}',
        );
        return ServerFailor<bool, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      print('Unknown Errors -> $e');
      return ServerFailor<bool, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! Add farmer to group API

  Future<Result<bool, Exception>> addFarmerToGroupAPI(
    String token,
    String farmerID,
    String groupID,
  ) async {
    ///! POST BODY
    var body = json.encode({
      'list': [farmerID],
    });

    ///! POST HEADER
    Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    ///! url to URI
    final Uri url = Uri.parse(
      ApiDatabaseParams.assignFarmerToGroup(groupID),
    );

    ///! Trying request to SErVER
    try {
      _headers.addAll(headers);
      print('headers addde');
      var resp = await http.post(
        url,
        body: json.encode({
          'list': [farmerID],
        }),
        headers: headers,
      );

      print('farmer id -> $farmerID\n groupID -> $groupID\n token -> $token');

      if (resp.statusCode == 200) {
        print('successfully done -> ${resp.statusCode} ${resp.body}');
        return Success<bool, Exception>(true);
      } else {
        print(
          'server resp -> ${resp.statusCode}\n${resp.body} ',
        );
        return ServerFailor<bool, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      print('Unknown Errors -> $e');
      return ServerFailor<bool, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! Add leader to group API

  Future<Result<bool, Exception>> updateLeaderToGroupAPI(
    String token,
    String leaderID,
    String groupID,
  ) async {
    ///! POST BODY
    // var body = json.encode({'group_leader': leaderID});

    ///! POST HEADER
    Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    ///! url to URI
    final Uri url = Uri.parse(
      ApiDatabaseParams.updateLeaderToGroup(groupID),
    );

    ///! Trying request to SErVER
    try {
      _headers.addAll(headers);
      print('headers addde');
      var resp = await http.put(
        url,
        body: json.encode({'group_leader': leaderID}),
        headers: headers,
      );

      print('farmer id -> $leaderID\n groupID -> $groupID\n token -> $token');

      if (resp.statusCode == 200) {
        print('successfully done -> ${resp.statusCode} ${resp.body}');
        return Success<bool, Exception>(true);
      } else {
        print(
          'server resp -> ${resp.statusCode}\n${resp.body} ',
        );
        return ServerFailor<bool, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      print('Unknown Errors -> $e');
      return ServerFailor<bool, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! Create Farm

  Future<Result<bool, Exception>> addFarm(
    AddFarmModel farmModel,
    String token,
    String lat,
    String long,
  ) async {
    ///! POST BODY
    var d = farmModel.farmProducingCrop
        .replaceAll('{', '')
        .replaceAll('}', '')
        .split(',');
    var focusedCorpFormat = json.encode(d);
    print(d);

    Map<String, String> body = <String, String>{
      'farmer_id': farmModel.farmerID,
      'farm_name': farmModel.farmName,
      'address': farmModel.farmLocation,
      'union': farmModel.farmUnion,
      'mouaza': farmModel.farmMouza,
      // 'lat': '24.2625',
      // 'long': '89.9305',
      'lat': lat,
      'long': long,
      // 'soil_type': 'Sandy',
      'soil_type': farmModel.farmSoilType,
      'farm_area': farmModel.farmArea,
      // 'farm_area': '20 Bagh',
      'starting_date': farmModel.farmStartingDate,
      'current_crop': focusedCorpFormat,
    };
    print('farm add body -> $body');

    ///! POST HEADER
    Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    ///! url to URI
    final Uri url = Uri.parse(
      ApiDatabaseParams.farmAddAPI,
    );
    try {
      _headers.addAll(headers);
      var request = http.MultipartRequest('POST', url);
      request.fields.addAll(body);

      int checkLoop = 0;
      for (final img in farmModel.images.toSet().toList()) {
        checkLoop++;
        print('$checkLoop -> ${img.path}');
        request.files.add(
          await http.MultipartFile.fromPath(
            'gallery[]',
            img.path,
          ),
        );
      }
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        print(
          'server success resp -> 201 -> ${response.reasonPhrase} ${await response.stream.bytesToString()}',
        );

        return Success<bool, Exception>(true);
      } else {
        var respMsg = await response.stream.bytesToString();
        print(
          'server resp -> ${response.statusCode}\n$respMsg',
        );

        print(
          'message -> ${jsonDecode(respMsg)["message"]}',
        );
        return ServerFailor<bool, Exception>(
          Exception(jsonDecode(respMsg)['message']),
        );
      }
    } catch (e) {
      print('Unknown Errors -> $e');
      return ServerFailor<bool, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! Placing an Order (Do Not Modify)

  Future<Result<bool, Exception>> placeAnOrder(
    String token,
    String farmerID,
    List<OrderModel> orders,
  ) async {
    List<Map<String, dynamic>> orderModelsToMaps(List<OrderModel> orderModels) {
      return orderModels.map((orderModel) => orderModel.toMap()).toList();
    }

    ///! POST BODY
    var body = json.encode({
      'sold_to': farmerID,
      'order': orderModelsToMaps(orders),
      // 'order': [
      //   for (final order in orders)
      //     {
      //       {
      //         'product_id': order.product_id,
      //         'unit': order.unit,
      //         'quantity': order.quantity,
      //       }
      //     }
      // ],
    });
    print('this is order body -> $body');
    print('this is order body -> $orderModelsToMaps(orders)');

    ///! POST HEADER
    Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    ///! url to URI
    final Uri url = Uri.parse(
      ApiDatabaseParams.inputerOrderApi,
    );

    ///! Trying request to SErVER
    try {
      _headers.addAll(headers);
      print('headers addde');
      var resp = await http.post(
        url,
        body: body,
        headers: headers,
      );

      // print('farmer id -> $farmerID\n groupID -> $groupID\n token -> $token');

      if (resp.statusCode == 201) {
        print('successfully done -> ${resp.statusCode} ${resp.body}');
        return Success<bool, Exception>(true);
      } else {
        print(
          'server resp -> ${resp.statusCode}\n${resp.body} ',
        );
        return ServerFailor<bool, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      print('Unknown Errors -> $e');
      return ServerFailor<bool, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }
}
