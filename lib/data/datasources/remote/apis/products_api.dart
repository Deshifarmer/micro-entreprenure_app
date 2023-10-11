import 'dart:convert';
import 'dart:isolate';

import 'package:deshifarmer/domain/entities/products_entity/product_entity.dart';
import 'package:deshifarmer/presentation/utils/get_product_url_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductFetchAPI {
  final Map<String, String> _headers = <String, String>{
    'Accept': 'application/json',
    // 'Authorization': 'Bearer ${ApiKeys.urlBayToken}',
  };

  // get producttt from search
  Future<ProductEntity?> getProductSearch(
    String token,
    String? company,
    String? category,
    String? query,
  ) async {
    final auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final url = getTheProductURL(
      query,
      company,
      category,
    );
    debugPrint('search url -> $url');
    try {
      _headers.addAll(auth);
      final response = await http.get(
        url,
        headers: _headers,
      );
      debugPrint('search response -> ${response.statusCode}');
      if (response.statusCode == 200) {
        final result = await Isolate.run(() => json.decode(response.body))
            as Map<String, dynamic>;
        try {
          final successResonse = ProductEntity.fromJson(result);
          // return Success<ProductEntity, Exception>(successResonse);
          return successResonse;
        } catch (e) {
          debugPrint('error -> $e');
          result.forEach((key, value) {});
        }
        // return ServerFailor<ProductEntity, Exception>(
        //   Exception('Server failor'),
        // );
        return null;
      } else {
        // return ServerFailor<ProductEntity, Exception>(
        //   Exception('Server failor'),
        // );
        return null;
      }
    } catch (e) {
      // return ServerFailor<ProductEntity, Exception>(
      //   Exception('Server failor -> $e'),
      // );
      return null;
    }
  }
}
