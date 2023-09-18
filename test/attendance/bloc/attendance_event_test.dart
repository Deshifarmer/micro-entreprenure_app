// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/attendance/bloc/bloc.dart';

void main() {
  group('AttendanceEvent', () {  
    group('CustomAttendanceEvent', () {
      test('supports value equality', () {
        expect(
          CustomAttendanceEvent(),
          equals(const CustomAttendanceEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomAttendanceEvent(),
          isNotNull,
        );
      });
    });
  });
}
