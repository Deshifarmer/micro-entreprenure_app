// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/bloc.dart';

void main() {
  group('ProductsState', () {
    test('supports value equality', () {
      expect(
        ProductsState(),
        equals(
          const ProductsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ProductsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const productsState = ProductsState(
            customProperty: 'My property',
          );
          expect(
            productsState.copyWith(),
            equals(productsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const productsState = ProductsState(
            customProperty: 'My property',
          );
          final otherProductsState = ProductsState(
            customProperty: 'My property 2',
          );
          expect(productsState, isNot(equals(otherProductsState)));

          expect(
            productsState.copyWith(
              customProperty: otherProductsState.customProperty,
            ),
            equals(otherProductsState),
          );
        },
      );
    });
  });
}
