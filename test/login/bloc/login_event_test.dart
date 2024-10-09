// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/login/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginEvent', () {  
    group('CustomLoginEvent', () {
      test('supports value equality', () {
        expect(
          CustomLoginEvent(),
          equals(const CustomLoginEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomLoginEvent(),
          isNotNull,
        );
      });
    });
  });
}
