// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/activity/bloc/bloc.dart';

void main() {
  group('ActivityEvent', () {  
    group('CustomActivityEvent', () {
      test('supports value equality', () {
        expect(
          CustomActivityEvent(),
          equals(const CustomActivityEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomActivityEvent(),
          isNotNull,
        );
      });
    });
  });
}
