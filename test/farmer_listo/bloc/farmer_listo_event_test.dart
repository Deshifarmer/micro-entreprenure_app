// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/farmer_listo/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmerListoEvent', () {  
    group('CustomFarmerListoEvent', () {
      test('supports value equality', () {
        expect(
          CustomFarmerListoEvent(),
          equals(const CustomFarmerListoEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomFarmerListoEvent(),
          isNotNull,
        );
      });
    });
  });
}
