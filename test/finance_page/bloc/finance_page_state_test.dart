// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/finance_page/bloc/bloc.dart';

void main() {
  group('FinancePageState', () {
    test('supports value equality', () {
      expect(
        FinancePageState(),
        equals(
          const FinancePageState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const FinancePageState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const financePageState = FinancePageState(
            customProperty: 'My property',
          );
          expect(
            financePageState.copyWith(),
            equals(financePageState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const financePageState = FinancePageState(
            customProperty: 'My property',
          );
          final otherFinancePageState = FinancePageState(
            customProperty: 'My property 2',
          );
          expect(financePageState, isNot(equals(otherFinancePageState)));

          expect(
            financePageState.copyWith(
              customProperty: otherFinancePageState.customProperty,
            ),
            equals(otherFinancePageState),
          );
        },
      );
    });
  });
}
