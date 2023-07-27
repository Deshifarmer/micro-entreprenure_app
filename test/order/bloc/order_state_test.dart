// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/order/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrderState', () {
    test('supports value equality', () {
      expect(
        OrderState(),
        equals(
          const OrderState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const OrderState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const orderState = OrderState(
            customProperty: 'My property',
          );
          expect(
            orderState.copyWith(),
            equals(orderState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const orderState = OrderState(
            customProperty: 'My property',
          );
          final otherOrderState = OrderState(
            customProperty: 'My property 2',
          );
          expect(orderState, isNot(equals(otherOrderState)));

          expect(
            orderState.copyWith(
              customProperty: otherOrderState.customProperty,
            ),
            equals(otherOrderState),
          );
        },
      );
    });
  });
}
