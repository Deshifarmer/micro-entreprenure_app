import 'dart:async';
import 'dart:convert';

import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/presentation/pages/finance_page/models/fianance_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FinanceAPI {
  final Map<String, String> _headers = <String, String>{
    'Accept': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded',
    'content-type': 'application/json',
    // 'Authorization': 'Bearer ${ApiKeys.urlBayToken}',
  };

  ///! Collect ORDERS
  FutureOr<(bool, String)> postFinance(FinanceModel fm, String token, List<String> dates,
      String schedule, double amount) async {
    debugPrint('Hit the postFinance');
    const localToken = '7015|04Mowh4vSzKJ7qWFXJdW3L47cswaUFezTdrMOEOX';
    // String _LOCAL_TOKEN = '55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK';
    final auth = <String, String>{
      'Authorization': 'Bearer ${localToken.isNotEmpty ? localToken : token}',
    };
    final url = Uri.parse(ApiDatabaseParams.financeAPI);

    /// do a post request
    try {
      debugPrint('tyrping to post finance');
      _headers.addAll(auth);
      debugPrint('finance post headers: $_headers');
      final Map<String, dynamic> _body = {
        'which_farmer': fm.farmerID,
        'season': fm.season,
        'producing_crop': fm.crop,
        // 'variety':fm.variety,
        'purpose_of_loan': fm.pol,
        'amount_of_loan': amount,
        // 'season_and_eta_sales':fm.eta,
        // 'note':fm.note,
        'payment_dates': dates,
        'payment_schedule': schedule,
      };
      if (fm.variety != null) {
        _body.addAll({'variety': fm.variety});
      }
      if (fm.eta != null) {
        _body.addAll({'season_and_eta_sales': fm.eta});
      }
      if (fm.note != null) {
        _body.addAll({'note': fm.note});
      }
      debugPrint('finance post body: $_body');
      final response = await http.post(
        url,
        headers: _headers,
        body: json.encode(_body),
      );
      debugPrint('finance post response: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('finance post response: ${response.body}');
        return (true, 'Successfull');
      } else {
        debugPrint('finance post response: ${response.body}');
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
        return (false, '${response.statusCode} Failed to Post the Data');
      }
    } catch (e) {
      debugPrint('Some error occured: $e');
      // FirebaseAnalyticsCustom.customLogEvent(
      //   name: 'collect_error (collectOrder)',
      //   parameters: <String, dynamic>{
      //     'error': e.toString(),
      //     'url': url.toString(),
      //     'token': token,
      //   },
      // );
      return (false, 'Some error Occured: $e');
    }
  }
}
