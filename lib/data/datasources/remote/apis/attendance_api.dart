import 'dart:convert';
import 'dart:isolate';

import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/domain/entities/attendance/att_history.dart';
import 'package:deshifarmer/domain/entities/attendance/todays_resp_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AttendanceAPI {
  final Map<String, String> _headers = <String, String>{
    'Accept': 'application/json',
    // 'Authorization': 'Bearer ${ApiKeys.urlBayToken}',
  };

  ///! check in API
  Future<(bool, String)> checkOut(
    String token,
    String id,
    String? msg,
    String imageFile,
    double lat,
    double lon,
  ) async {
    final auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final url = Uri.parse(
      '${ApiDatabaseParams.checkinAPI}/$id',
    );

    try {
      _headers.addAll(auth);
      final request = http.MultipartRequest('POST', url);
      request.fields.addAll({
        'cout_note': msg ?? '',
        'cout_location': [lat, lon].toString(),
        'check_out': '',
      });
      request.files.add(
        await http.MultipartFile.fromPath(
          'cout_image',
          imageFile,
        ),
      );
      debugPrint('check out api called -> $url $id $token');
      request.headers.addAll(auth);
      final response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('successfully checed out ');
        return (true, '');
      } else {
        debugPrint(
          'error occured cut -> ${response.statusCode} ${await response.stream.bytesToString()}}',
        );
        return (false, '');
      }
    } catch (e) {
      debugPrint('error occured no checkout -> $e');
      return (false, '');
    }
  }

  ///! Get todays attendance
  Future<TodaysAttendance?> getTodaysAttendance(String token) async {
    final auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final url = Uri.parse(
      ApiDatabaseParams.todaysAttendanceAPI,
    );
    debugPrint('get todays attendance -> $url');
    try {
      _headers.addAll(auth);
      final response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        debugPrint('todays att response -> ${response.body}');
        final result = await Isolate.run(() => json.decode(response.body))
            as Map<String, dynamic>;
        return TodaysAttendance.fromJson(result);
      } else {
        debugPrint(
          'error occured on getting todays attendance -> ${response.statusCode} ${response.body}',
        );
        return null;
      }
    } catch (e) {
      debugPrint('error occured on getting todays attendance -> $e');
      return null;
    }
  }

  ///! Get Attendance History
  Future<(List<AttendaceHistoryEntity>, bool)> attendanceHistory(
    String token,
  ) async {
    final auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final url = Uri.parse(
      ApiDatabaseParams.attendanceHistory,
    );
    debugPrint('url -> $url $token');
    try {
      _headers.addAll(auth);
      final response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        final result = await Isolate.run(() => json.decode(response.body))
            as List<dynamic>;
        final list = result
            .map(
              (e) => AttendaceHistoryEntity.fromJson(e as Map<String, dynamic>),
            )
            .toList();
        return (list, true);
      } else {
        debugPrint(
          'error occured on getting attendance history -> ${response.statusCode} ${response.body}',
        );
        return (<AttendaceHistoryEntity>[], false);
      }
    } catch (e) {
      debugPrint('error occured on getting attendance history -> $e');
      return (<AttendaceHistoryEntity>[], false);
    }
  }

  ///! check in api
  Future<(bool, bool)> checkInAPI(
    String token,
    String? msg,
    String imageFile,
    double lat,
    double lon,
  ) async {
    final auth = <String, String>{
      'Authorization': 'Bearer $token',
    };
    final url = Uri.parse(
      ApiDatabaseParams.checkinAPI,
    );
    debugPrint('check in api called -> $url $token');
    try {
      _headers.addAll(auth);
      final request = http.MultipartRequest('POST', url);
      request.fields.addAll({
        'cin_note': msg ?? '',
        'cin_location': [lat, lon].toString(),
        'check_in': '',
      });
      request.files.add(
        await http.MultipartFile.fromPath(
          'cin_image',
          imageFile,
        ),
      );
      request.headers.addAll(auth);
      final response = await request.send();
      if (response.statusCode == 201) {
        /// debugPrint the response body
        debugPrint('successfully checed in ${response.statusCode}');
        debugPrint('check in response -> ${await response.stream.bytesToString()}');
        return (true, true);
      } else {
        debugPrint(
          'check in failed -> ${response.statusCode} ${await response.stream.bytesToString()} }',
        );
        return (false, false);
      }
    } catch (e) {
      debugPrint('check in error occured -> $e');
      return (false, false);
    }
  }
}
