// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmaddFormEvent', () {  
    group('CustomFarmaddFormEvent', () {
      test('supports value equality', () {
        expect(
          CustomFarmaddFormEvent(),
          equals(const CustomFarmaddFormEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomFarmaddFormEvent(),
          isNotNull,
        );
      });
    });
  });
}
