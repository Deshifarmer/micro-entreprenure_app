import 'dart:convert';
import 'dart:isolate';

import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/domain/entities/attendance/att_history.dart';
import 'package:deshifarmer/domain/entities/attendance/todays_resp_entity.dart';
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
      print('check out api called -> $url $id $token');
      request.headers.addAll(auth);
      final response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('successfully checed out ');
        return (true, '');
      } else {
        print(
          'error occured cut -> ${response.statusCode} ${await response.stream.bytesToString()}}',
        );
        return (false, '');
      }
    } catch (e) {
      print('error occured no checkout -> $e');
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
    print('get todays attendance -> $url');
    try {
      _headers.addAll(auth);
      final response = await http.get(
        url,
        headers: _headers,
      );
      if (response.statusCode == 200) {
        print('todays att response -> ${response.body}');
        final result = await Isolate.run(() => json.decode(response.body))
            as Map<String, dynamic>;
        return TodaysAttendance.fromJson(result);
      } else {
        print(
          'error occured on getting todays attendance -> ${response.statusCode} ${response.body}',
        );
        return null;
      }
    } catch (e) {
      print('error occured on getting todays attendance -> $e');
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
    print('url -> $url $token');
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
        print(
          'error occured on getting attendance history -> ${response.statusCode} ${response.body}',
        );
        return (<AttendaceHistoryEntity>[], false);
      }
    } catch (e) {
      print('error occured on getting attendance history -> $e');
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
    print('check in api called -> $url $token');
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
        /// print the response body
        print('successfully checed in ${response.statusCode}');
        print('check in response -> ${await response.stream.bytesToString()}');
        return (true, true);
      } else {
        print(
          'check in failed -> ${response.statusCode} ${await response.stream.bytesToString()} }',
        );
        return (false, false);
      }
    } catch (e) {
      print('check in error occured -> $e');
      return (false, false);
    }
  }
}
