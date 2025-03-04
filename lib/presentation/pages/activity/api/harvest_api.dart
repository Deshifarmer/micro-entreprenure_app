import 'dart:convert';
import 'dart:isolate';
import 'package:deshifarmer/core/analytics/firebase_analytics_custom.dart';
import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/data/models/record_activity_model.dart';
import 'package:deshifarmer/domain/entities/batch/batch_entity.dart';
import 'package:deshifarmer/domain/entities/crop_entity/single_crop_entity.dart';
import 'package:deshifarmer/domain/entities/krishibebsa_pro/prod_entity.dart';
import 'package:deshifarmer/domain/entities/source_entity/source_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/api/entity/unit_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/models/batch_reponse_entity.dart';
import 'package:deshifarmer/presentation/pages/harvest/model/harvest_model.dart';
import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HarvestAPI {
  final Map<String, String> _headers = <String, String>{
    'Accept': 'application/json',
  };

  //! get CROP from different API
  Future<List<SingleCropEntity>> getCropFromAnotherAPI() async {
    // final url = Uri.parse(
    //   'https://server.krishibebsha.com/api/v1/product',
    // );
    // debugPrint('crop url -> $url');
    //
    // final cropList = <SingleCropEntity>[];
    //
    // try {
    //   final response = await http.get(
    //     url,
    //   );
    //   debugPrint('status code -> ${response.statusCode}');
    //   if (response.statusCode == 200) {
    //     final result = await Isolate.run(() => json.decode(response.body))
    //         as List<dynamic>;
    //     debugPrint(
    //       'successfuly got the singlecropentity LISTO -> ${result.runtimeType} ${result.length}',
    //     );
    //
    //     for (var i = 0; i < result.length; i++) {
    //       final element = result[i] as Map<String, dynamic>;
    //       // debugPrint('element runtime -> ${element.runtimeType}');
    //       try {
    //         cropList.add(
    //           SingleCropEntity.fromJson(element),
    //         );
    //       } catch (e) {
    //         // debugPrint(
    //         //   'error comverting data single crop entity ->  ${element.runtimeType}, $e \n',
    //         // );
    //         FirebaseAnalyticsCustom.customLogEvent(
    //           name: 'crop_error',
    //           parameters: {
    //             'error': e.toString(),
    //             'url': url.toString(),
    //             // 'body': response.body,
    //           },
    //         );
    //       }
    //     }
    //     return cropList;
    //   } else {
    //     FirebaseAnalyticsCustom.customLogEvent(
    //       name: 'crop_error',
    //       parameters: {
    //         'error': response.statusCode,
    //         'url': url.toString(),
    //         'body': response.body,
    //       },
    //     );
    //
    //     return [];
    //   }
    // } catch (e) {
    //   FirebaseAnalyticsCustom.customLogEvent(
    //     name: 'crop_error',
    //     parameters: {
    //       'error': e.toString(),
    //       'url': url.toString(),
    //       // 'body': response.body,
    //     },
    //   );
    //   return [];
    // }
    return[];
  }

  // harvest post
  Future<(bool, String)> postHarvest({
    required HarvestModel hm,
    required String token,
  }) async {
    // final url = Uri.parse(
    //   ApiDatabaseParams.harvestPostAPI,
    // );
    //
    // ///! POST HEADER
    // final headers = <String, String>{
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token',
    // };
    // final body = {
    //   'product_name': hm.crop,
    //   // 'variety': hm.jatt,
    //   'buy_price': hm.price,
    //   'quantity': hm.quantity,
    //   'unit': hm.unit,
    //   'market_name': hm.marketName,
    //   // 'description': hm.note,
    //   'source_location': hm.location,
    //   'which_farmer': hm.name,
    // };
    // if (hm.jatt.isNotEmpty) {
    //   body.addAll({'variety': hm.jatt});
    // } else {
    //   debugPrint('Jatt is empty');
    // }
    // if (hm.note.isNotEmpty) {
    //   body.addAll({'description': hm.note});
    // } else {
    //   debugPrint('NOTE is empty');
    // }
    // debugPrint('harvest url -> \n$url \n$token \n$body');
    // try {
    //   _headers.addAll(headers);
    //   if (hm.image.isEmpty) {
    //     debugPrint('image is empty doing by normal post');
    //     final response = await http.post(
    //       url,
    //       headers: _headers,
    //       body: json.encode(body),
    //     );
    //     // // wait for 1 sec
    //     // await Future<void>.delayed(const Duration(seconds: 1));
    //     debugPrint('status code -> ${response.statusCode}');
    //     if (response.statusCode == 201) {
    //       return (true, '');
    //     } else {
    //       debugPrint('body -> $body');
    //       debugPrint(
    //         'error -> ${response.statusCode} ${response.reasonPhrase} ${response.body}',
    //       );
    //       FirebaseAnalyticsCustom.customLogEvent(
    //         name: 'harvest_post_error',
    //         parameters: {
    //           'error': response.statusCode,
    //           'body': response.body,
    //           'url': url.toString(),
    //           'token': token,
    //         },
    //       );
    //       return (false, '${response.statusCode} Error Occured');
    //     }
    //   } else {
    //     debugPrint('image is not empty doing by multipart post');
    //
    //     final request = http.MultipartRequest('POST', url);
    //     request.fields.addAll(body);
    //     request.files.add(
    //         await http.MultipartFile.fromPath('product_images[]', hm.image));
    //     request.headers.addAll(headers);
    //     final response = await request.send();
    //     debugPrint('status code -> ${response.statusCode}');
    //     if (response.statusCode == 201) {
    //       return (true, '');
    //     } else {
    //       debugPrint('body -> $body');
    //       debugPrint(
    //         'error -> ${response.statusCode} ${response.reasonPhrase} ${await response.stream.bytesToString()}',
    //       );
    //
    //       FirebaseAnalyticsCustom.customLogEvent(
    //         name: 'harvest_post_error',
    //         parameters: {
    //           'error': response.statusCode,
    //           'body': await response.stream.bytesToString(),
    //           'url': url.toString(),
    //           'token': token,
    //         },
    //       );
    //       return (false, '${response.statusCode} Error Occured');
    //     }
    //   }
    // } catch (e) {
    //   debugPrint('Exception -> $e');
    //   FirebaseAnalyticsCustom.customLogEvent(
    //     name: 'harvest_post_error',
    //     parameters: {
    //       'error': e.toString(),
    //       'url': url.toString(),
    //       'token': token,
    //     },
    //   );
    //   return (false, e.toString());
    // }

    return (true, '');

  }

  // get harvest
  Future<List<SourcingEntity>?> getHarvests(String token) async {
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
            // FirebaseAnalyticsCustom.customLogEvent(
            //   name: 'harvest_get_error',
            //   parameters: {
            //     'error': e.toString(),
            //     'url': url.toString(),
            //     'token': token,
            //   },
            // );
          }
        }
        return harvestList;
      } else {
        debugPrint('error -> ${response.statusCode} ${response.body}');
        // FirebaseAnalyticsCustom.customLogEvent(
        //   name: 'harvest_get_error',
        //   parameters: {
        //     'error': response.statusCode,
        //     'body': response.body,
        //     'url': url.toString(),
        //     'token': token,
        //   },
        // );
        return null;
      }
    } catch (e) {
      debugPrint('Exception -> $e');
      // FirebaseAnalyticsCustom.customLogEvent(
      //   name: 'harvest_get_error',
      //   parameters: {
      //     'error': e.toString(),
      //     'url': url.toString(),
      //     'token': token,
      //   },
      // );
      return null;
    }
  }

  Future<bool?> recordActivity(RecordActivityModel ram) async {
    const TOKEN = '';
    const batchId = '';

    ///! POST HEADER
    final headers = <String, String>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${TOKEN.isNotEmpty ? TOKEN : ram.token}',
    };
    if (ram.whatType == ActivityTypeEnums.landpref) {
      debugPrint('Chekcing images -> ${ram.images.length}');
      //* LAND PREP
      final body = {
        'batch_id': ram.batchID,
        'land_preparation_date': ram.landPepData,
        'details': ram.details,
        'img len': ram.images.length.toString(),
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
            'error -> ${response.statusCode} ${response.reasonPhrase} ${await response.stream.bytesToString()}',
          );
          // FirebaseAnalyticsCustom.customLogEvent(
          //   name: 'land_prep_post_error',
          //   parameters: {
          //     'error': response.statusCode,
          //     'body': await response.stream.bytesToString(),
          //     'url': url.toString(),
          //     'token': ram.token,
          //   },
          // );
          return false;
        }
      } catch (e) {
        debugPrint('Exception -> $e');
        // FirebaseAnalyticsCustom.customLogEvent(
        //   name: 'land_prep_post_error',
        //   parameters: {
        //     'error': e.toString(),
        //     'url': url.toString(),
        //     'token': ram.token,
        //   },
        // );
        return false;
      }
    } else if (ram.whatType == ActivityTypeEnums.sowing) {
      //* SOWING
      debugPrint(
        'Sowing -> ${ram.sowingCrop} ${ram.sowingNameWithCompany} ${ram.sowingSeedQuantity} ${ram.batchID}',
      );
      _headers.addAll(headers);
      final body = {
        'batch_id': batchId.isNotEmpty ? batchId : ram.batchID,
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
          // FirebaseAnalyticsCustom.customLogEvent(
          //   name: 'sowing_post_error',
          //   parameters: {
          //     'error': response.statusCode,
          //     'body': response.body,
          //     'url': url.toString(),
          //     'token': ram.token,
          //   },
          // );
          return false;
        }
      } catch (e) {
        // FirebaseAnalyticsCustom.customLogEvent(
        //   name: 'sowing_post_error',
        //   parameters: {
        //     'error': e.toString(),
        //     'url': url.toString(),
        //     'token': ram.token,
        //   },
        // );
        return false;
      }
    } else if (ram.whatType == ActivityTypeEnums.fertilizer) {
      final url = Uri.parse(
        ApiDatabaseParams.fertilizationPost,
      );

      _headers.addAll(headers);
      final body = {
        'batch_id': batchId.isNotEmpty ? batchId : ram.batchID,
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
          // FirebaseAnalyticsCustom.customLogEvent(
          //   name: 'fertilizer_post_error',
          //   parameters: {
          //     'error': response.statusCode,
          //     'body': response.body,
          //     'url': url.toString(),
          //     'token': ram.token,
          //   },
          // );
          return false;
        }
      } catch (e) {
        // FirebaseAnalyticsCustom.customLogEvent(
        //     name: 'fertilizer_post_error',
        //     parameters: {
        //       'error': e.toString(),
        //       'url': url.toString(),
        //       'token': ram.token,
        //     });
        return false;
      }
    } else if (ram.whatType == ActivityTypeEnums.pesticide) {
      final url = Uri.parse(
        ApiDatabaseParams.pesticidePost,
      );

      _headers.addAll(headers);
      final body = {
        'batch_id': batchId.isNotEmpty ? batchId : ram.batchID,
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
          // FirebaseAnalyticsCustom.customLogEvent(
          //   name: 'pesticide_post_error',
          //   parameters: {
          //     'error': response.statusCode,
          //     'body': response.body,
          //     'url': url.toString(),
          //     'token': ram.token,
          //   },
          // );
          return false;
        }
      } catch (e) {
        // FirebaseAnalyticsCustom.customLogEvent(
        //     name: 'pesticide_post_error',
        //     parameters: {
        //       'error': e.toString(),
        //       'url': url.toString(),
        //       'token': ram.token,
        //     });
        return false;
      }
    } else if (ram.whatType == ActivityTypeEnums.irrigation) {
      //! WATering
      _headers.addAll(headers);
      final body = {
        'batch_id': batchId.isNotEmpty ? batchId : ram.batchID,
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
          // FirebaseAnalyticsCustom.customLogEvent(
          //   name: 'irrigation_post_error',
          //   parameters: {
          //     'error': response.statusCode,
          //     'body': response.body,
          //     'url': url.toString(),
          //     'token': ram.token,
          //   },
          // );
          return false;
        }
      } catch (e) {
        // FirebaseAnalyticsCustom.customLogEvent(
        //     name: 'irrigation_post_error',
        //     parameters: {
        //       'error': e.toString(),
        //       'url': url.toString(),
        //       'token': ram.token,
        //     });
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
            // FirebaseAnalyticsCustom.customLogEvent(
            //   name: 'krishibebsha_prod_error',
            //   parameters: {
            //     'error': e.toString(),
            //     'url': url.toString(),
            //     // 'body': response.body,
            //   },
            // );
            debugPrint(
              'error comverting data BatchEnity ->  ${element.runtimeType}, $e \n',
            );
          }
        }
        return prodList;
      } else {
        // FirebaseAnalyticsCustom.customLogEvent(
        //   name: 'krishibebsha_prod_error',
        //   parameters: {
        //     'error': response.statusCode,
        //     'url': url.toString(),
        //     'body': response.body,
        //   },
        // );
        return null;
      }
    } catch (e) {
      // FirebaseAnalyticsCustom.customLogEvent(
      //   name: 'krishibebsha_prod_error',
      //   parameters: {
      //     'error': e.toString(),
      //     'url': url.toString(),
      //     // 'body': response.body,
      //   },
      // );
      return null;
    }
  }

  //! get bitches

  //! batch getting api
  Future<List<BatchEnity>?> getLatestBatches({required String token}) async {
    final auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final url = Uri.parse(
      ApiDatabaseParams.latestbatchListAPI,
    );
    debugPrint('batch get url -> $url $token');
    try {
      _headers.addAll(auth);
      final response = await http.get(
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
        final companyE = <BatchEnity>[];
        for (var i = 0; i < result.length; i++) {
          final element = result[i] as Map<String, dynamic>;
          // debugPrint('element runtime -> ${element.runtimeType}');
          try {
            companyE.add(
              BatchEnity.fromJson(element),
            );
          } catch (e) {
            // FirebaseAnalyticsCustom.customLogEvent(
            //   name: 'batch_get_error',
            //   parameters: {
            //     'error': e.toString(),
            //     'url': url.toString(),
            //     // 'body': response.body,
            //   },
            // );
            debugPrint(
              'error comverting data BatchEnity ->  ${element.runtimeType}, $e \n',
            );
          }
        }
        return companyE;
      } else {
        // FirebaseAnalyticsCustom.customLogEvent(
        //   name: 'batch_get_error',
        //   parameters: {
        //     'error': response.statusCode,
        //     'url': url.toString(),
        //     'body': response.body,
        //   },
        // );
        return null;
      }
    } catch (e) {
      // FirebaseAnalyticsCustom.customLogEvent(
      //   name: 'batch_get_error',
      //   parameters: {
      //     'error': e.toString(),
      //     'url': url.toString(),
      //     // 'body': response.body,
      //   },
      // );
      return null;
    }
  }

  //! get batch response
  Future<BatchResponseEntity?> getBatchData({
    required String token,
    required String bID,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final url = Uri.parse(
      '${ApiDatabaseParams.getBatchInfo}/$bID',
    );
    debugPrint('batch get url -> $url $token');
    try {
      _headers.addAll(headers);
      final response = await http.get(
        url,
        headers: _headers,
      );
      debugPrint('status code -> ${response.statusCode}');
      if (response.statusCode == 200) {
        final result = await Isolate.run(() => json.decode(response.body))
            as Map<String, dynamic>;
        debugPrint(
          'successfuly got the batch LISTO -> ${result.runtimeType} ${result.length}',
        );
        try {
          return BatchResponseEntity.fromJson(result);
        } catch (e) {
          // FirebaseAnalyticsCustom.customLogEvent(
          //   name: 'batch_get_error',
          //   parameters: {
          //     'error': e.toString(),
          //     'url': url.toString(),
          //     // 'body': response.body,
          //   },
          // );
          debugPrint(
            'error comverting data BatchEnity ->  ${result.runtimeType}, $e \n',
          );
          return null;
        }
      } else {
        // FirebaseAnalyticsCustom.customLogEvent(
        //   name: 'batch_get_error',
        //   parameters: {
        //     'error': response.statusCode,
        //     'url': url.toString(),
        //     'body': response.body,
        //   },
        // );
        return null;
      }
    } catch (e) {
      // FirebaseAnalyticsCustom.customLogEvent(
      //   name: 'batch_get_error',
      //   parameters: {
      //     'error': e.toString(),
      //     'url': url.toString(),
      //     // 'body': response.body,
      //   },
      // );
      return null;
    }
  }
  //! get units

  Future<List<UnitEntity>> getUnitFromAnotherAPI() async {
    final url = Uri.parse(
      'https://server.krishibebsha.com/api/v1/unit',
    );
    debugPrint('unit url -> $url');

    final cropList = <UnitEntity>[];

    try {
      final response = await http.get(
        url,
      );
      debugPrint('status code -> ${response.statusCode}');
      if (response.statusCode == 200) {
        final result = await Isolate.run(() => json.decode(response.body))
            as List<dynamic>;
        debugPrint(
          'successfuly got the unit LISTO -> ${result.runtimeType} ${result.length}',
        );

        for (var i = 0; i < result.length; i++) {
          final element = result[i] as Map<String, dynamic>;
          // debugPrint('element runtime -> ${element.runtimeType}');
          try {
            cropList.add(
              UnitEntity.fromJson(element),
            );
          } catch (e) {
            // FirebaseAnalyticsCustom.customLogEvent(
            //   name: 'unit_error',
            //   parameters: {
            //     'error': e.toString(),
            //     'url': url.toString(),
            //     // 'body': response.body,
            //   },
            // );
            debugPrint(
              'error comverting data unit ->  ${element.runtimeType}, $e \n',
            );
          }
        }
        return cropList;
      } else {
        // FirebaseAnalyticsCustom.customLogEvent(
        //   name: 'unit_error',
        //   parameters: {
        //     'error': response.statusCode,
        //     'url': url.toString(),
        //     'body': response.body,
        //   },
        // );
        return [];
      }
    } catch (e) {
      // FirebaseAnalyticsCustom.customLogEvent(
      //   name: 'unit_error',
      //   parameters: {
      //     'error': e.toString(),
      //     'url': url.toString(),
      //     // 'body': response.body,
      //   },
      // );
      return [];
    }
  }
}
