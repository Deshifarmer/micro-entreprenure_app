// ignore_for_file: omit_local_variable_types, prefer_final_locals

import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:deshifarmer/core/app_core.dart';
import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/data/models/add_farm_model.dart';
import 'package:deshifarmer/data/models/add_farmer_model.dart';
import 'package:deshifarmer/data/models/order_model.dart';
import 'package:deshifarmer/domain/entities/batch/batch_entity.dart';
import 'package:deshifarmer/domain/entities/category_entity/all_categorys.dart';
import 'package:deshifarmer/domain/entities/category_entity/category_entity.dart';
import 'package:deshifarmer/domain/entities/company_entity/all_company_entity.dart';
import 'package:deshifarmer/domain/entities/company_entity/company_response_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity_again.dart';
import 'package:deshifarmer/domain/entities/group_detail_entity/group_detail_entity.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/group_field_entity.dart';
import 'package:deshifarmer/domain/entities/login_entity/login_response_entity.dart';
import 'package:deshifarmer/domain/entities/orders_entity/all_orders.dart';
import 'package:deshifarmer/domain/entities/orders_entity/order_response_entity.dart';
import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:flutter/material.dart';
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
    debugPrint('$url');
    try {
      final http.Response response = await http.post(url);
      // debugdebugPrint('login response -> ${response.statusCode}');
      if (response.statusCode == 200) {
        final result = await Isolate.run(() => json.decode(response.body));
        try {
          SuccessLoginEntity successResonse =
              SuccessLoginEntity.fromJson(result as Map<String, dynamic>);

          return Success<SuccessLoginEntity, Exception>(successResonse);
        } catch (e) {
          debugPrint('error -> $e');
          return ServerFailor<SuccessLoginEntity, Exception>(
            Exception('Server failor'),
          );
        }
        // return ServerFailor<SuccessLoginEntity, Exception>(
        //   Exception('Server failor'),
        // );
      } else {
        // debugPrint(response.)
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
    // debugPrint('logout url -> $url $token');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.post(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        // debugPrint("${response.statusCode} | ${response.body}");
        return true;
      } else {
        // debugPrint("${response.statusCode} | ${response.body}");
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
    // String _LOCAL_TOKEN = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
    String localToken = '';
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer ${localToken.isNotEmpty ? localToken : token}',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.orderApi,
    );
    // debugPrint('url $url $token');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final result = await Isolate.run(() => json.decode(response.body))
        as Map<String, dynamic>;
        try {

          final successResponse = AllOrdersEntity.fromJson(result);
          // return Success<ProductEntity, Exception>(successResonse);
          return Success<AllOrdersEntity, Exception>(successResponse);
          //return successResonse;
        } catch (e) {
          debugPrint('error -> $e');
          result.forEach((key, value) {});

          debugPrint(
            'Farmer getting EXCEPTION -> ${e.toString().split(':').firstOrNull}',);
          return ServerFailor<AllOrdersEntity, Exception>(
            Exception('Server failor $e'),
          );
        }
        // debugPrint(response.statusCode);
        // final result = await Isolate.run(() => json.decode(response.body))
        //     as List<dynamic>;
        // // debugPrint('result -> $result');
        // List<OrderEntity> orderEntitys = [];
        // for (int i = 0; i < result.length; i++) {
        //   final element = result[i];
        //   try {
        //     orderEntitys.add(
        //       OrderEntity.fromJson(element as Map<String, dynamic>),
        //     );
        //     // debugPrint('entity added successfully -> $i');
        //   } catch (e) {
        //     // debugPrint('exception occurd on OrderEntity $e');
        //     // result2.forEach((key, value) {});
        //   }
        // }
        // AllOrdersEntity successResonse = AllOrdersEntity(orderEntitys);
        //
        // return Success<AllOrdersEntity, Exception>(successResonse);
      } else {
        return ServerFailor<AllOrdersEntity, Exception>(
          Exception('${response.statusCode} ${response.body}'),
        );
      }
    } catch (e) {
      return ServerFailor<AllOrdersEntity, Exception>(
        Exception('${e.toString().split(':').firstOrNull}'),
      );
    }
  }

  ///! Collect ORDERS
  FutureOr<bool> collectOrder(String id, String token) async {
    String localToken = '';
    // String _LOCAL_TOKEN = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer ${localToken.isNotEmpty ? localToken : token}',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.collectOrderApi + id,
    );

    /// do a post request
    try {
      _headers.addAll(auth);
      final http.Response response = await http.put(
        url,
        headers: _headers,
        body: {
          'status': 'collected by me',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
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
    debugPrint('url $url $token');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final result = await Isolate.run(() => json.decode(response.body))
            as Map<String, dynamic>;
        try {
          UserProfileEntity successResonse = UserProfileEntity.fromJson(result);
          return Success<UserProfileEntity, Exception>(successResonse);
        } catch (e) {
          result.forEach(
            (key, value) {},
          );
          return ServerFailor<UserProfileEntity, Exception>(
            Exception('Server failor'),
          );
        }
      } else {
        return ServerFailor<UserProfileEntity, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
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
    debugPrint('url $url $token');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      debugPrint('url $url $token');
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
            debugPrint('exception occurd on Company $e');
            // e2.forEach((key, value) {
            //   if (value.runtimeType != String) {
            //     debugPrint('${value.runtimeType} $key $value');
            //   }
            // });
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
    debugPrint('url $url $token');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      debugPrint('url $url $token');
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
            // final e2 = element as Map<String, dynamic>;
            // e2.forEach((key, value) {});
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

  // ///! get PRODUCTS (DONOTEDIT)
  // Future<Result<ProductEntity, Exception>> getProducts(String token) async {
  //   Map<String, String> auth = <String, String>{
  //     'Authorization': 'Bearer $token',
  //   };
  //   final Uri url = Uri.parse(
  //     ApiDatabaseParams.productListAPI,
  //   );
  //   try {
  //     _headers.addAll(auth);
  //     final http.Response response = await http.get(
  //       url,
  //       headers: _headers,
  //     );
  //     if (response.statusCode == 200) {
  //       final result = await Isolate.run(() => json.decode(response.body))
  //           as Map<String, dynamic>;
  //       debugPrint('product successfully got');
  //       try {
  //         ProductEntity successResonse = ProductEntity.fromJson(result);
  //         return Success<ProductEntity, Exception>(successResonse);
  //       } catch (e) {
  //         debugPrint('error -> $e');
  //         result.forEach((key, value) {});
  //       }
  //       return ServerFailor<ProductEntity, Exception>(
  //         Exception('Server failor'),
  //       );
  //     } else {
  //       return ServerFailor<ProductEntity, Exception>(
  //         Exception('Server failor'),
  //       );
  //     }
  //   } catch (e) {
  //     return ServerFailor<ProductEntity, Exception>(
  //       Exception('Server failor -> $e'),
  //     );
  //   }
  // }

  // /// get product (search, company, category)
  // Future<Result<ProductEntity, Exception>> getProductSearch(
  //     String token, String? company, String? category, String? query) async {
  //   Map<String, String> auth = <String, String>{
  //     'Authorization': 'Bearer $token',
  //   };
  //   final Uri url = getTheProductURL(
  //     query,
  //     company,
  //     category,
  //   );
  //   debugPrint('search url -> $url');
  //   try {
  //     _headers.addAll(auth);
  //     final http.Response response = await http.get(
  //       url,
  //       headers: _headers,
  //     );
  //     debugPrint('search response -> ${response.statusCode}');
  //     if (response.statusCode == 200) {
  //       final result = await Isolate.run(() => json.decode(response.body))
  //           as Map<String, dynamic>;
  //       try {
  //         ProductEntity successResonse = ProductEntity.fromJson(result);
  //         return Success<ProductEntity, Exception>(successResonse);
  //       } catch (e) {
  //         debugPrint('error -> $e');
  //         result.forEach((key, value) {});
  //       }
  //       return ServerFailor<ProductEntity, Exception>(
  //         Exception('Server failor'),
  //       );
  //     } else {
  //       return ServerFailor<ProductEntity, Exception>(
  //         Exception('Server failor'),
  //       );
  //     }
  //   } catch (e) {
  //     return ServerFailor<ProductEntity, Exception>(
  //       Exception('Server failor -> $e'),
  //     );
  //   }
  // }

  // ///! Get Product Paginate
  // Future<Result<ProductEntity, Exception>> getProductsPaginate(
  //   String token,
  //   String page,
  // ) async {
  //   Map<String, String> auth = <String, String>{
  //     'Authorization': 'Bearer $token',
  //   };
  //   final Uri url = Uri.parse(
  //     page,
  //   );
  //   try {
  //     _headers.addAll(auth);
  //     final http.Response response = await http.get(
  //       url,
  //       headers: _headers,
  //     );
  //     if (response.statusCode == 200) {
  //       final result = await Isolate.run(() => json.decode(response.body))
  //           as Map<String, dynamic>;
  //       try {
  //         ProductEntity successResonse = ProductEntity.fromJson(result);
  //         return Success<ProductEntity, Exception>(successResonse);
  //       } catch (e) {
  //         result.forEach((key, value) {});
  //       }
  //       return ServerFailor<ProductEntity, Exception>(
  //         Exception('Server failor'),
  //       );
  //     } else {
  //       return ServerFailor<ProductEntity, Exception>(
  //         Exception('Server failor'),
  //       );
  //     }
  //   } catch (e) {
  //     return ServerFailor<ProductEntity, Exception>(
  //       Exception('Server failor -> $e'),
  //     );
  //   }
  // }

  ///* Get single Farmer LIST
  Future<FarmerEntityAgain?> getSingleFarmer(
    String token,
    String farmerID,
  ) async {
    // String _LOCAL_TOKEN = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
    String localToken = '';
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer ${localToken.isNotEmpty ? localToken : token}',
    };
    final Uri url = Uri.parse(
      '${ApiDatabaseParams.myFarmerApi}/$farmerID',
    );
    debugPrint('url -> $url ${localToken.isNotEmpty ? localToken : token}');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        debugPrint('farm resp -> ${response.statusCode}');
        final result = await Isolate.run(() => json.decode(response.body))
            as Map<String, dynamic>;
        debugPrint(
          'successfuly got the fffffF -> ${result.runtimeType} ${result.length}',
        );
        try {
          final farmEntity = FarmerEntityAgain.fromJson(result);
          return farmEntity;
        } catch (e) {
          debugPrint(
            'error comverting data FarmerEntityAgain->  ${result.runtimeType}, $e \n',
          );
        }
        // debugPrint('converting to farmEntity -> ${farmEntity.runtimeType}');
        return null;
      } else {
        debugPrint('error -> ${response.statusCode} ${response.body}');
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  ///! DO NOT MODIFY THE ABOVE CONTENT (DANGER)
  ///*-------------------------------------------------------------*///
  ///
  ///* Get the Farmer LIST
  Future<Result<AllFarmerListRespEntity, Exception>> getFarmers(String token) async {
    String localToken = '';
    // String _LOCAL_TOKEN = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer ${localToken.isNotEmpty ? localToken : token}',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.myFarmerApi,
    );
    // debugPrint(
    //   'getting farmers url -> $url ${localToken.isNotEmpty ? localToken : token}',
    // );
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        // debugPrint('getting farmer resp -> ${response.statusCode}');
        // final result = await Isolate.run(() => json.decode(response.body))
        //     as Map<String,dynamic>;
        // debugPrint(
        //   'successfuly got the farmers -> ${result.runtimeType} ${result.length}',
        // );
        //
        // List<FarmerEntity> companyE = [];
        // List data = result["data"] as List<dynamic>;
        // for (int i = 0; i < data.length; i++) {
        //   final element = data[i] as Map<String, dynamic>;
        //   // debugPrint('element runtime -> ${element.runtimeType}');
        //   try {
        //     companyE.add(
        //       FarmerEntity.fromJson(element),
        //     );
        //   } catch (e) {
        //     debugPrint(
        //       'error comverting data FarmerEntity->  ${element.runtimeType}, $e \n',
        //     );
        //   }
        // }
        // AllFarmerListRespEntity successResonse = AllFarmerListRespEntity(companyE);
        // debugPrint('returning successResonse -> ${companyE.length}');
        //
        // return Success<AllFarmerListRespEntity, Exception>(successResonse);
        final result = await Isolate.run(() => json.decode(response.body))
        as Map<String, dynamic>;
        try {

          final successResponse = AllFarmerListRespEntity.fromJson(result);
          // return Success<ProductEntity, Exception>(successResonse);
          return Success<AllFarmerListRespEntity, Exception>(successResponse);
          //return successResonse;
        } catch (e) {
          debugPrint('error -> $e');
          result.forEach((key, value) {});

          debugPrint(
            'Farmer getting EXCEPTION -> ${e.toString().split(':').firstOrNull}',);
          return ServerFailor<AllFarmerListRespEntity, Exception>(
            Exception('Server failor $e'),
          );
        }
      } else {
        return ServerFailor<AllFarmerListRespEntity, Exception>(
          Exception('${response.statusCode} ${response.body}'),
        );
      }
    } catch (e) {
      // debugPrint('EXC#EPTION -> ${e.toString().split(':').firstOrNull}');
      return ServerFailor<AllFarmerListRespEntity, Exception>(
        Exception('${e.toString().split(':').firstOrNull}'),
      );
    }
  }

  ///* Get the Unassign Farmer LIST
  Future<Result<AllFarmerListRespEntity, Exception>> getUnassingFarmers(
    String token,
  ) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.unassignFarmersApi,
    );
    // debugPrint('unassign url -> $url $token');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        // final result = await Isolate.run(() => json.decode(response.body))
        //     as List<dynamic>;

        final result = await Isolate.run(() => json.decode(response.body))
        as Map<String, dynamic>;
        try {
          final successResonse = AllFarmerListRespEntity.fromJson(result);
          // return Success<ProductEntity, Exception>(successResonse);
          return Success<AllFarmerListRespEntity, Exception>(successResonse);
          //return successResonse;
        } catch (e) {
          debugPrint('error -> $e');
          result.forEach((key, value) {});

          debugPrint(
            'FArmer getting EXCEPTION -> ${e.toString().split(':').firstOrNull}',);
          return ServerFailor<AllFarmerListRespEntity, Exception>(
            Exception('Server failor $e'),
          );
        }
        // debugPrint(
        //   'successfuly got the Unassing LISTO -> ${result.runtimeType} ${result.length}',
        // );
        // List<FarmerEntity> companyE = [];
        // for (int i = 0; i < result.length; i++) {
        //   final element = result[i] as Map<String, dynamic>;
        //   // debugPrint('element runtime -> ${element.runtimeType}');
        //   try {
        //     companyE.add(
        //       FarmerEntity.fromJson(element),
        //     );
        //   } catch (e) {
        //     // debugPrint(
        //     //   'error comverting List<FarmerEntity> ->  ${element.runtimeType}, $e \n',
        //     // );
        //     // final e2 = element;
        //     // e2.forEach((key, value) {
        //     //   if (value.runtimeType != String) {
        //     //     debugPrint('${value.runtimeType} $key $value');
        //     //   }
        //     // });
        //   }
        // }
        // AllFarmerListRespEntity successResonse = AllFarmerListRespEntity(companyE);

        //return Success<AllFarmerListRespEntity, Exception>(successResonse);
      } else {
        return ServerFailor<AllFarmerListRespEntity, Exception>(
          Exception('${response.statusCode} ${response.body}'),
        );
      }
    } catch (e) {
      return ServerFailor<AllFarmerListRespEntity, Exception>(
        Exception('Server failor $e'),
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
    debugPrint('group url -> $url $token');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as List<dynamic>;
        debugPrint(
          'successfuly Unassign GROUPs -> ${result.runtimeType} ${result.length}',
        );
        List<GroupFieldEntity> companyE = [];
        for (int i = 0; i < result.length; i++) {
          final element = result[i] as Map<String, dynamic>;
          // debugPrint('element runtime -> ${element.runtimeType}');
          try {
            companyE.add(
              GroupFieldEntity.fromJson(element),
            );
          } catch (e) {
            debugPrint(
              'error comverting data Unassing GroupFieldEntity ->  ${element.runtimeType}, $e \n',
            );
// // getFarmersGroup
            // final e2 = element;
            // e2.forEach((key, value) {
            //   if (value.runtimeType != String) {
            //     debugPrint('${value.runtimeType} $key $value');
            //   }
            // });
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

  // ///! fetch farm data
  // Future<Result<AllFarmListResp, Exception>> fetchFarmData(
  //   String token,
  //   String farmerID,
  // ) async {
  //   String _LOCAL_TOKEN = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
  //   Map<String, String> auth = <String, String>{
  //     'Authorization':
  //         'Bearer ${_LOCAL_TOKEN.isNotEmpty ? _LOCAL_TOKEN : token}',
  //   };
  //   final Uri url = Uri.parse(
  //     '${ApiDatabaseParams.myFarmerApi}/$farmerID',
  //   );
  //   debugPrint('farm url -> $url ${_LOCAL_TOKEN.isNotEmpty ? _LOCAL_TOKEN : token}');
  //   try {
  //     _headers.addAll(auth);
  //     final http.Response response = await http.get(
  //       url,
  //       headers: _headers,
  //     );
  //     if (response.statusCode == 200) {
  //       final result = await Isolate.run(() => json.decode(response.body))
  //           as List<dynamic>;
  //       debugPrint(
  //         'successfuly got the farm LISTO -> ${result.runtimeType} ${result.length}',
  //       );
  //       List<FarmEntity> companyE = [];
  //       for (int i = 0; i < result.length; i++) {
  //         final element = result[i] as Map<String, dynamic>;
  //         // debugPrint('element runtime -> ${element.runtimeType}');
  //         try {
  //           companyE.add(
  //             FarmEntity.fromJson(element),
  //           );
  //         } catch (e) {
  //           debugPrint(
  //             'error comverting List<FarmerEntity> ->  ${element.runtimeType}, $e \n',
  //           );
  //           final e2 = element;
  //           e2.forEach((key, value) {
  //             if (value.runtimeType != String) {
  //               debugPrint('${value.runtimeType} $key $value');
  //             }
  //           });
  //         }
  //       }
  //       AllFarmListResp successResonse = AllFarmListResp(companyE);

  //       return Success<AllFarmListResp, Exception>(successResonse);
  //     } else {
  //       return ServerFailor<AllFarmListResp, Exception>(
  //         Exception('Server failor'),
  //       );
  //     }
  //   } catch (e) {
  //     return ServerFailor<AllFarmListResp, Exception>(
  //       Exception('Server failor -> $e'),
  //     );
  //   }
  // }

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
      debugPrint('url -> $url \n token -> $token');
      // debugPrint('toekn $token \n groupid -> $groupID');
      if (response.statusCode == 200) {
        final result = json.decode(response.body) as Map<String, dynamic>;

        try {
          GroupDetailEntity successResonse = GroupDetailEntity.fromJson(result);
          // GroupDetailEntity successResonse = GroupDetailEntity.fromJson(result);

          return Success<GroupDetailEntity, Exception>(successResonse);
        } catch (e) {
          result.forEach((key, value) {
            if (value.runtimeType != String) {
              debugPrint('${value.runtimeType} $key $value');
            }
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
  ///! DANGER ZONEEEEEEEEEEEEEEEEEEE
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

    var d2 = farmerModel.currentProducingCrop
        ?.replaceAll('{', '')
        .replaceAll('}', '')
        .split(',');
    var currentCorpFormat = {
      'cropname': d2,
    };
    Map<String, String> body = <String, String>{
      'farmer_type': '1',
      // 'onboard_by': farmerModel.onboardBy ?? '', //! NOT NEEDED
      'nid': farmerModel.nid,
      // 'gov_farmer_id': farmerModel.govtFarmerID.toString(), //? check if govt id or DO NOT ADD THE FIELD
      'first_name': farmerModel.firstName,
      'last_name': farmerModel.lastName,
      'fathers_name': farmerModel.fathersName,
      'phone': farmerModel.phone,
      'is_married': farmerModel.isMarried == 'Unmarried' ? '0' : '1',
      'gender': farmerModel.gender,
      'date_of_birth':
          '${farmerModel.dateOfBirth.year}-${farmerModel.dateOfBirth.month}-${farmerModel.dateOfBirth.day}',
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
    }
    var msfDetail = farmerModel.mfsAccount! as Map<String, String>;

    if (msfDetail['mfs_type']!.isNotEmpty &&
        msfDetail['mfs_account']!.isNotEmpty) {
      // 'mfs_account': json.encode(farmerModel.mfsAccount), // JSON
      body['mfs_account'] = json.encode(farmerModel.mfsAccount); //JSON
    }

    // debugPrint(
    //     'focused crop -> ${json.encode({'cropname':${_d.runtimeType} ${_d})}');
    // debugPrint('-d -> ${json.encode(fFor)}');

    // debugPrint(
    //     'beauty -> ${farmerModel.focusedCrop?.replaceAll("{", "").replaceAll("}", "").split(" ")}');

    ///! POST HEADER
    Map<String, String> headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    ///! url to URI
    final Uri url = Uri.parse(
      ApiDatabaseParams.addFarmerApi,
      // 'https://core.deshifarmer.co/api/v1/me/add_farmer'
    );
    debugPrint('url $url $token');

    ///! Trying request to SErVER
    try {
      _headers.addAll(headers);
      var request = http.MultipartRequest('POST', url);
      // debugPrint('image path from API -> ${farmerModel.image}');
      // debugPrint('dob -> ${body["date_of_birth"]}');
      request.fields.addAll(body);

      request.files
          .add(await http.MultipartFile.fromPath('image', farmerModel.image!));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        return Success<bool, Exception>(true);
      } else {
        var respMsg = await response.stream.bytesToString();

        return ServerFailor<bool, Exception>(
          Exception(jsonDecode(respMsg)['message']),
        );
      }
    } catch (e) {
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

    ///! url to URI
    final Uri url = Uri.parse(
      ApiDatabaseParams.createGroupAPI,
    );
    debugPrint('url $url $token');
    debugPrint('body -> $body');

    ///! Trying request to SErVER
    try {
      _headers.addAll(headers);
      var request = http.MultipartRequest('POST', url);
      request.fields.addAll(body);

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        debugPrint('group created successfully -> ${response.statusCode}');
        return Success<bool, Exception>(true);
      } else {
        var respMsg = await response.stream.bytesToString();
        debugPrint('group created failed -> ${response.statusCode} $respMsg');
        return ServerFailor<bool, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      debugPrint('group created failed -> $e');
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
    debugPrint('url $url $token');

    ///! Trying request to SErVER
    try {
      _headers.addAll(headers);
      var resp = await http.post(
        url,
        body: json.encode({
          'list': [farmerID],
        }),
        headers: headers,
      );

      if (resp.statusCode == 200) {
        return Success<bool, Exception>(true);
      } else {
        return ServerFailor<bool, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
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
    debugPrint('url $url $token');

    ///! Trying request to SErVER
    try {
      _headers.addAll(headers);
      var resp = await http.put(
        url,
        body: json.encode({'group_leader': leaderID}),
        headers: headers,
      );

      if (resp.statusCode == 200) {
        return Success<bool, Exception>(true);
      } else {
        return ServerFailor<bool, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
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
    debugPrint('url $url $token');
    try {
      _headers.addAll(headers);
      var request = http.MultipartRequest('POST', url);
      request.fields.addAll(body);
      for (final img in farmModel.images.toSet().toList()) {
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
        return Success<bool, Exception>(true);
      } else {
        var respMsg = await response.stream.bytesToString();

        return ServerFailor<bool, Exception>(
          Exception(jsonDecode(respMsg)['message']),
        );
      }
    } catch (e) {
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
    debugPrint('url $url $token');

    ///! Trying request to SErVER
    try {
      _headers.addAll(headers);
      var resp = await http.post(
        url,
        body: body,
        headers: headers,
      );

      // debugPrint('farmer id -> $farmerID\n groupID -> $groupID\n token -> $token');

      if (resp.statusCode == 201) {
        return Success<bool, Exception>(true);
      } else {
        return ServerFailor<bool, Exception>(
          Exception('Server failor'),
        );
      }
    } catch (e) {
      return ServerFailor<bool, Exception>(
        Exception('Server failor -> $e'),
      );
    }
  }

  ///! Batch Creation API
  Future<BatchEnity?> batchCreationAPI({
    required String token,
    required String farmID,
    required String season,
    required String whichCrop,
  }) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.batchCreationAPI,
    );
    debugPrint('batch url -> $url $token');

    try {
      _headers.addAll(auth);
      final http.Response response = await http.post(
        url,
        body: {
          'farm_id': farmID,
          'season': season,
          'which_crop': whichCrop,
        },
        headers: _headers,
      );
      final x = {
        'farm_id': farmID,
        'season': season,
        'which_crop': whichCrop,
      };
      debugPrint('status code -> ${response.statusCode}');
      debugPrint('body -> $x');
      if (response.statusCode == 201) {
        final result = await Isolate.run(() => json.decode(response.body))
            as Map<String, dynamic>;
        debugPrint(
          'successfuly got the batch LISTO -> ${result.runtimeType} ${result.length}',
        );
        try {
          BatchEnity successResonse = BatchEnity.fromJson(result);
          return successResonse;
        } catch (e) {
          debugPrint(
            'error comverting data BatchEnity ->  ${result.runtimeType}, $e \n',
          );
        }
        return null;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  //! batch getting api
  Future<List<BatchEnity>?> getFarmBatches(
      {required String token, required String farmID,}) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final Uri url = Uri.parse(
      '${ApiDatabaseParams.batchListAPI}?farm_id=$farmID',
    );
    debugPrint('batch get url -> $url $token');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      debugPrint('status code -> ${response.statusCode}');
      if (response.statusCode == 200) {
        final result = await Isolate.run(() => json.decode(response.body))
            as List<dynamic>;
        debugPrint(
          'successfuly got the batch LISTO -> ${result.runtimeType} ${result.length}',
        );
        List<BatchEnity> companyE = [];
        for (int i = 0; i < result.length; i++) {
          final element = result[i] as Map<String, dynamic>;
          // debugPrint('element runtime -> ${element.runtimeType}');
          try {
            companyE.add(
              BatchEnity.fromJson(element),
            );
          } catch (e) {
            debugPrint(
              'error comverting data BatchEnity ->  ${element.runtimeType}, $e \n',
            );
          }
        }
        return companyE;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  /// get farmers without any shit
  ///* Get the Farmer LIST
  Future<AllFarmerListRespEntity?> getFarmers2(String token) async {
    String localToken = '';
    // String _LOCAL_TOKEN = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer ${localToken.isNotEmpty ? localToken : token}',
    };
    final Uri url = Uri.parse(
      ApiDatabaseParams.myFarmerApi,
    );
    debugPrint('url -> $url $token');
    try {
      _headers.addAll(auth);
      final http.Response response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        // debugPrint('yeah successfully got the data');
        // final result = await Isolate.run(() => json.decode(response.body))
        //     as List<dynamic>;

        final result = await Isolate.run(() => json.decode(response.body))
        as Map<String, dynamic>;
        try {
          final successResonse = AllFarmerListRespEntity.fromJson(result);
          // return Success<ProductEntity, Exception>(successResonse);
          return successResonse;
        } catch (e) {
          debugPrint('error -> $e');
          result.forEach((key, value) {});

          debugPrint(
            'FArmer getting EXCEPTION -> ${e.toString().split(':').firstOrNull}',);
          return null;
        }

        // List<FarmerEntity> companyE = [];
        // for (int i = 0; i < result.length; i++) {
        //   final element = result[i] as Map<String, dynamic>;
        //   try {
        //     companyE.add(
        //       FarmerEntity.fromJson(element),
        //     );
        //   } catch (e) {}
        // }
        // AllFarmerListRespEntity successResonse = AllFarmerListRespEntity(companyE);
        //
        // return successResonse;
      } else {
        debugPrint(
            'farmer list getting error -> ${response.statusCode} ${response.body}',);
        return null;
      }
    } catch (e) {
      debugPrint(
          'FArmer getting EXCEPTION -> ${e.toString().split(':').firstOrNull}',);
      return null;
    }
  }
}
