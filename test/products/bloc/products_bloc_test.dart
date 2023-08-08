// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductsBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ProductsBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final productsBloc = ProductsBloc();
      expect(productsBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ProductsBloc, ProductsState>(
      'CustomProductsEvent emits nothing',
      build: ProductsBloc.new,
      act: (bloc) => bloc.add(const CustomProductsEvent()),
      expect: () => <ProductsState>[],
    );
  });
}
