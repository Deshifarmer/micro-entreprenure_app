// ignore_for_file: omit_local_variable_types, prefer_final_locals

import 'dart:convert';

import 'package:deshifarmer/core/app_core.dart';
import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/domain/entities/category_entity/all_categorys.dart';
import 'package:deshifarmer/domain/entities/category_entity/category_entity.dart';
import 'package:deshifarmer/domain/entities/company_entity/all_company_entity.dart';
import 'package:deshifarmer/domain/entities/company_entity/company_response_entity.dart';
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
    try {
      final http.Response response = await http.post(url);
      if (response.statusCode == 200) {
        // print(response.statusCode);
        final result = json.decode(response.body);
        // print(result);

        SuccessLoginEntity successResonse =
            SuccessLoginEntity.fromJson(result as Map<String, dynamic>);

        return Success<SuccessLoginEntity, Exception>(successResonse);
        // return ServerFailor<SuccessLoginEntity, Exception>(
        //   Exception('Server failor'),
        // );
      } else {
        print(response.statusCode);
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
      if (response.statusCode == 200) {
        print('status 200');
        final result = json.decode(response.body);
        UserProfileEntity successResonse =
            UserProfileEntity.fromJson(result as Map<String, dynamic>);
        return Success<UserProfileEntity, Exception>(successResonse);
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
}
