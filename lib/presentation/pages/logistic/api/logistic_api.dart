import 'dart:convert';
import 'dart:isolate';

import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/domain/entities/source_entity/source_entity.dart';
import 'package:deshifarmer/presentation/pages/logistic/model/logistic_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LogisticAPI {
  final Map<String, String> _headers = <String, String>{
    'Accept': 'application/json',
    // 'Authorization': 'Bearer ${ApiKeys.urlBayToken}',
  };

  //! get CROP from different API

  // harvest post
  Future<bool> postLogistic(
      {required LogisticModel lm, required String token,}) async {
    final url = Uri.parse(
      ApiDatabaseParams.postLogisticAPI,
    );

    ///! POST HEADER
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = {
      'from': lm.from,
      'to': lm.to,
      'vehicle_type': lm.trackType,
      'weight': lm.weight,
    };
    debugPrint('harvest url -> $url');

    try {
      _headers.addAll(headers);
      final response = await http.post(
        url,
        headers: _headers,
        body: json.encode(body),
      );
      debugPrint('status code -> ${response.statusCode}');
      if (response.statusCode == 201) {
        return true;
      } else {
        debugPrint('Lets see -> ${response.body}');
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // get harvest
  Future<List<SourcingEntity>?> getLogistic(String token) async {
    const localToken = '';
    final auth = <String, String>{
      'Authorization': 'Bearer ${localToken.isNotEmpty ? localToken : token}',
    };
    final url = Uri.parse(
      ApiDatabaseParams.harvestGetAPI,
    );
    debugPrint('harvest url -> $url $token');
    try {
      final response = await http.get(
        url,
        headers: auth,
      );
      debugPrint('status code -> ${response.statusCode}');
      if (response.statusCode == 200) {
        final result = await Isolate.run(() => json.decode(response.body))
            as List<dynamic>;
        debugPrint(
          'successfuly got the batch LISTO -> ${result.runtimeType} ${result.length}',
        );
        final harvestList = <SourcingEntity>[];
        for (var i = 0; i < result.length; i++) {
          final element = result[i] as Map<String, dynamic>;
          // debugPrint('element runtime -> ${element.runtimeType}');
          try {
            harvestList.add(
              SourcingEntity.fromJson(element),
            );
          } catch (e) {
            debugPrint(
              'error comverting data BatchEnity ->  ${element.runtimeType}, $e \n',
            );
          }
        }
        return harvestList;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
