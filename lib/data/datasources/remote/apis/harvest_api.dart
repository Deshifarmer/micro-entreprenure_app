import 'dart:convert';
import 'dart:isolate';

import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/domain/entities/crop_entity/single_crop_entity.dart';
import 'package:deshifarmer/domain/entities/source_entity/source_entity.dart';
import 'package:deshifarmer/presentation/pages/harvest/model/harvest_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HarvestAPI {
  final Map<String, String> _headers = <String, String>{
    'Accept': 'application/json',
    // 'Authorization': 'Bearer ${ApiKeys.urlBayToken}',
  };

  //! get CROP from different API
  Future<List<SingleCropEntity>> getCropFromAnotherAPI() async {
    final url = Uri.parse(
      'https://server.krishibebsha.com/api/v1/product',
    );
    debugPrint('crop url -> $url');

    final cropList = <SingleCropEntity>[];

    try {
      final response = await http.get(
        url,
      );
      debugPrint('status code -> ${response.statusCode}');
      if (response.statusCode == 200) {
        final result = await Isolate.run(() => json.decode(response.body))
            as List<dynamic>;
        debugPrint(
          'successfuly got the batch LISTO -> ${result.runtimeType} ${result.length}',
        );

        for (var i = 0; i < result.length; i++) {
          final element = result[i] as Map<String, dynamic>;
          // debugPrint('element runtime -> ${element.runtimeType}');
          try {
            cropList.add(
              SingleCropEntity.fromJson(element),
            );
          } catch (e) {
            debugPrint(
              'error comverting data BatchEnity ->  ${element.runtimeType}, $e \n',
            );
          }
        }
        return cropList;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // harvest post
  Future<bool> postHarvest(
      {required HarvestModel hm, required String token}) async {
    final url = Uri.parse(
      ApiDatabaseParams.harvestPostAPI,
    );

    ///! POST HEADER
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = {
      'product_name': hm.crop,
      'variety': hm.jatt,
      'buy_price': hm.price,
      'quantity': hm.quantity,
      'unit': hm.unit,
      'description': hm.note,
      'source_location': hm.location,
      'which_farmer': hm.name,
    };
    debugPrint('harvest url -> $url');
    try {
      _headers.addAll(headers);
      final request = http.MultipartRequest('POST', url);
      request.fields.addAll(body);
      request.files
          .add(await http.MultipartFile.fromPath('product_images[]', hm.image));
      request.headers.addAll(headers);
      final response = await request.send();
      debugPrint('status code -> ${response.statusCode}');
      if (response.statusCode == 201) {
        return true;
      } else {
        debugPrint('body -> $body');
        debugPrint(
            'error -> ${response.statusCode} ${response.reasonPhrase} ${await response.stream.bytesToString()}');
        return false;
      }
    } catch (e) {
      debugPrint('Exception -> $e');
      return false;
    }
  }

  // get harvest
  Future<List<SourcingEntity>?> getHarvests(String token) async {
    const localToken = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
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
