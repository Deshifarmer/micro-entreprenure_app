// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/harvest/bloc/bloc.dart';

void main() {
  group('HarvestEvent', () {  
    group('CustomHarvestEvent', () {
      test('supports value equality', () {
        expect(
          CustomHarvestEvent(),
          equals(const CustomHarvestEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomHarvestEvent(),
          isNotNull,
        );
      });
    });
  });
}
