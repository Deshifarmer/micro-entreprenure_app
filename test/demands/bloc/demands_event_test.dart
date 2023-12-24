// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/demands/bloc/bloc.dart';

void main() {
  group('DemandsEvent', () {  
    group('CustomDemandsEvent', () {
      test('supports value equality', () {
        expect(
          CustomDemandsEvent(),
          equals(const CustomDemandsEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomDemandsEvent(),
          isNotNull,
        );
      });
    });
  });
}
