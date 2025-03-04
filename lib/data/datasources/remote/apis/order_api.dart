import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

import 'package:deshifarmer/core/analytics/firebase_analytics_custom.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/domain/entities/orders_entity/all_orders.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class OrderAPI {
  final Map<String, String> _headers = <String, String>{
    'Accept': 'application/json',
    // 'Authorization': 'Bearer ${ApiKeys.urlBayToken}',
  };

  ///! User ORDERS
  Future<Result<AllOrdersEntity, Exception>> userOrder(
    String token,
  ) async {
    // String _LOCAL_TOKEN = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
    const localToken = '';
    final auth = <String, String>{
      'Authorization': 'Bearer ${localToken.isNotEmpty ? localToken : token}',
    };
    final url = Uri.parse(
      ApiDatabaseParams.orderApi,
    );
    debugPrint('url $url $token');
    try {
      _headers.addAll(auth);
      final response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        // debugPrint(response.statusCode);
        final result = await Isolate.run(() => json.decode(response.body))
            as Map<String, dynamic>;

        final successResonse = AllOrdersEntity.fromJson(result);

        return Success<AllOrdersEntity, Exception>(successResonse);
      } else {
        // FirebaseAnalyticsCustom.customLogEvent(
        //   name: 'order_error (userOrder)',
        //   parameters: <String, dynamic>{
        //     'code': response.statusCode.toString(),
        //     'url': url.toString(),
        //     'token': token,
        //     'body': response.body,
        //   },
        // );
        return ServerFailor<AllOrdersEntity, Exception>(
          Exception('${response.statusCode} ${response.body}'),
        );
      }
    } catch (e) {
      // FirebaseAnalyticsCustom.customLogEvent(
      //   name: 'order_error (userOrder)',
      //   parameters: <String, dynamic>{
      //     'error': e.toString(),
      //     'url': url.toString(),
      //     'token': token,
      //   },
      // );
      return ServerFailor<AllOrdersEntity, Exception>(
        Exception('${e.toString().split(':').firstOrNull}'),
      );
    }
  }

 ///! User ORDERS
  Future<(AllOrdersEntity?,String?)> userOrder2(
    String token,
  ) async {
    // String _LOCAL_TOKEN = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
    const localToken = '';
    final auth = <String, String>{
      'Authorization': 'Bearer ${localToken.isNotEmpty ? localToken : token}',
    };
    final url = Uri.parse(
      ApiDatabaseParams.orderApi,
    );
    debugPrint('url $url $token');
    try {
      _headers.addAll(auth);
      final response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        // debugPrint(response.statusCode);
        final result = await Isolate.run(() => json.decode(response.body))
            as Map<String, dynamic>;

        final successResonse = AllOrdersEntity.fromJson(result);

        return (successResonse,'Nice');
      } else {
        // FirebaseAnalyticsCustom.customLogEvent(
        //   name: 'order_error (userOrder)',
        //   parameters: <String, dynamic>{
        //     'code': response.statusCode.toString(),
        //     'url': url.toString(),
        //     'token': token,
        //     'body': response.body,
        //   },
        // );
        // return ServerFailor<AllOrdersEntity, Exception>(
        //   Exception('${response.statusCode} ${response.body}'),
        // );
        return (null,'${response.statusCode} ${response.body}');
      }
    } catch (e) {
      // FirebaseAnalyticsCustom.customLogEvent(
      //   name: 'order_error (userOrder)',
      //   parameters: <String, dynamic>{
      //     'error': e.toString(),
      //     'url': url.toString(),
      //     'token': token,
      //   },
      // );
      // return ServerFailor<AllOrdersEntity, Exception>(
      //   Exception('${e.toString().split(':').firstOrNull}'),
      // );
      return (null,'${e.toString().split(':').firstOrNull}');
    }
  }
  ///! Collect ORDERS
  FutureOr<bool> collectOrder(String id, String token) async {
    const localToken = '';
    // String _LOCAL_TOKEN = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
    final auth = <String, String>{
      'Authorization': 'Bearer ${localToken.isNotEmpty ? localToken : token}',
    };
    final url = Uri.parse(
      ApiDatabaseParams.collectOrderApi + id,
    );

    /// do a post request
    try {
      _headers.addAll(auth);
      final response = await http.put(
        url,
        headers: _headers,
        body: {
          'status': 'collected by me',
        },
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        // FirebaseAnalyticsCustom.customLogEvent(
        //   name: 'collect_error (collectOrder)',
        //   parameters: <String, dynamic>{
        //     'code': response.statusCode,
        //     'url': url.toString(),
        //     'token': token,
        //     'method': 'put',
        //     'body': response.body,
        //   },
        // );
        return false;
      }
    } catch (e) {
      // FirebaseAnalyticsCustom.customLogEvent(
      //   name: 'collect_error (collectOrder)',
      //   parameters: <String, dynamic>{
      //     'error': e.toString(),
      //     'url': url.toString(),
      //     'token': token,
      //   },
      // );
      return false;
    }
  }
}
