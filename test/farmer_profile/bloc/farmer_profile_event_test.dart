// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/farmer_profile/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmerProfileEvent', () {  
    group('CustomFarmerProfileEvent', () {
      test('supports value equality', () {
        expect(
          CustomFarmerProfileEvent(),
          equals(const CustomFarmerProfileEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomFarmerProfileEvent(),
          isNotNull,
        );
      });
    });
  });
}
