// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/myorder/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyorderEvent', () {  
    group('CustomMyorderEvent', () {
      test('supports value equality', () {
        expect(
          CustomMyorderEvent(),
          equals(const CustomMyorderEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomMyorderEvent(),
          isNotNull,
        );
      });
    });
  });
}
