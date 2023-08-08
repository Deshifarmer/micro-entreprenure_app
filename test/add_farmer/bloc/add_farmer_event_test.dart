// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddFarmerEvent', () {  
    group('CustomAddFarmerEvent', () {
      test('supports value equality', () {
        expect(
          CustomAddFarmerEvent(),
          equals(const CustomAddFarmerEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomAddFarmerEvent(),
          isNotNull,
        );
      });
    });
  });
}
