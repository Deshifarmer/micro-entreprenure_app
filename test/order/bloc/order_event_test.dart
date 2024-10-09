// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrderEvent', () {  
    group('CustomOrderEvent', () {
      test('supports value equality', () {
        expect(
          CustomOrderEvent(),
          equals(const CustomOrderEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomOrderEvent(),
          isNotNull,
        );
      });
    });
  });
}
