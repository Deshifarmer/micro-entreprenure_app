// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/products/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductsEvent', () {  
    group('CustomProductsEvent', () {
      test('supports value equality', () {
        expect(
          CustomProductsEvent(),
          equals(const CustomProductsEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomProductsEvent(),
          isNotNull,
        );
      });
    });
  });
}
