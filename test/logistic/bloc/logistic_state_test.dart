// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/logistic/bloc/bloc.dart';

void main() {
  group('LogisticState', () {
    test('supports value equality', () {
      expect(
        LogisticState(),
        equals(
          const LogisticState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const LogisticState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const logisticState = LogisticState(
            customProperty: 'My property',
          );
          expect(
            logisticState.copyWith(),
            equals(logisticState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const logisticState = LogisticState(
            customProperty: 'My property',
          );
          final otherLogisticState = LogisticState(
            customProperty: 'My property 2',
          );
          expect(logisticState, isNot(equals(otherLogisticState)));

          expect(
            logisticState.copyWith(
              customProperty: otherLogisticState.customProperty,
            ),
            equals(otherLogisticState),
          );
        },
      );
    });
  });
}
