import 'dart:convert';
import 'dart:isolate';

import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/data/models/record_activity_model.dart';
import 'package:deshifarmer/domain/entities/batch/batch_entity.dart';
import 'package:deshifarmer/domain/entities/crop_entity/single_crop_entity.dart';
import 'package:deshifarmer/domain/entities/krishibebsa_pro/prod_entity.dart';
import 'package:deshifarmer/domain/entities/source_entity/source_entity.dart';
import 'package:deshifarmer/presentation/pages/harvest/model/harvest_model.dart';
import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
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

  Future<bool?> recordActivity(RecordActivityModel ram) async {
    final TOKEN = '';
    final BATCH_ID = '';

    ///! POST HEADER
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${TOKEN.isNotEmpty ? TOKEN : ram.token}',
    };
    // print('thi sis runne dsdfa');
    if (ram.whatType == ActivityTypeEnums.landpref) {
      //* LAND PREP
      final body = {
        'batch_id': ram.batchID,
        'land_preparation_date': ram.landPepData,
        'details': ram.details,
      };
      final url = Uri.parse(
        ApiDatabaseParams.harvestLandPrepPost,
      );
      debugPrint('url -> $url ${ram.token}');
      try {
        _headers.addAll(headers);
        final request = http.MultipartRequest('POST', url);
        request.fields.addAll(body);
        for (final img in ram.images.toSet().toList()) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'images[]',
              img.path,
            ),
          );
        }
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
    } else if (ram.whatType == ActivityTypeEnums.sowing) {
      //* SOWING
      debugPrint(
          'Sowing -> ${ram.sowingCrop} ${ram.sowingNameWithCompany} ${ram.sowingSeedQuantity} ${ram.batchID}');
      _headers.addAll(headers);
      final body = {
        'batch_id': BATCH_ID.isNotEmpty ? BATCH_ID : ram.batchID,
        'seed_name': ram.sowingCrop,
        'seed_company': ram.sowingNameWithCompany,
        'seed_quantity': ram.sowingSeedQuantity,
        'seed_price': ram.sowingSeedPrice,
        'seed_unit': ram.sowingSeedUnit,
        'details': ram.details,
      };
      final url = Uri.parse(
        ApiDatabaseParams.harvestSowingPost,
      );
      debugPrint('url -> $url $body ${ram.token}');
      try {
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
    } else if (ram.whatType == ActivityTypeEnums.fertilizer) {
      final url = Uri.parse(
        ApiDatabaseParams.fertilizationPost,
      );

      _headers.addAll(headers);
      final body = {
        'batch_id': BATCH_ID.isNotEmpty ? BATCH_ID : ram.batchID,
        'fertilizer_type': ram.fertilizerType,
        'fertilizer_name': ram.fertilizerName,
        'amount': ram.fertilizerAmount,
        'details': ram.details,
      };
      debugPrint('url -> $url $body ${ram.token}');
      try {
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
    } else if (ram.whatType == ActivityTypeEnums.pesticide) {
      final url = Uri.parse(
        ApiDatabaseParams.pesticidePost,
      );

      _headers.addAll(headers);
      final body = {
        'batch_id': BATCH_ID.isNotEmpty ? BATCH_ID : ram.batchID,
        'pesticide_type': ram.pesticideType,
        'pesticide_name': ram.pesticideName,
        'amount': ram.pesticideAmount,
        'details': ram.details,
      };
      debugPrint('url -> $url $body ${ram.token}');
      try {
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
    } else if (ram.whatType == ActivityTypeEnums.irrigation) {
      //! WATering
      _headers.addAll(headers);
      final body = {
        'batch_id': BATCH_ID.isNotEmpty ? BATCH_ID : ram.batchID,
        'hours': ram.irrigationWateringHours,
        'details': ram.details,
      };
      final url = Uri.parse(
        ApiDatabaseParams.irrigationPost,
      );
      debugPrint('url -> $url $body ${ram.token}');
      try {
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
    } else if (ram.whatType == ActivityTypeEnums.reportProblem) {
      final url = Uri.parse(
        ApiDatabaseParams.harvestSowingPost,
      );
    }
    return null;
  }

  //* get list of KrishibebshaProd
  Future<List<KrishibebshaProd>?> getKrishProd() async {
    final url = Uri.parse(
      'https://server.krishibebsha.com/api/v1/product',
    );
    debugPrint('url -> $url');

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
        final prodList = <KrishibebshaProd>[];
        for (var i = 0; i < result.length; i++) {
          final element = result[i] as Map<String, dynamic>;
          // debugPrint('element runtime -> ${element.runtimeType}');
          try {
            prodList.add(
              KrishibebshaProd.fromJson(element),
            );
          } catch (e) {
            debugPrint(
              'error comverting data BatchEnity ->  ${element.runtimeType}, $e \n',
            );
          }
        }
        return prodList;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  //! get bitches

  //! batch getting api
  Future<List<BatchEnity>?> getLatestBatches({required String token}) async {
    Map<String, String> auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final url = Uri.parse(
      ApiDatabaseParams.batchListAPI,
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
}
