// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommisionState', () {
    test('supports value equality', () {
      expect(
        CommisionState(),
        equals(
          const CommisionState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CommisionState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const commisionState = CommisionState(
            customProperty: 'My property',
          );
          expect(
            commisionState.copyWith(),
            equals(commisionState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const commisionState = CommisionState(
            customProperty: 'My property',
          );
          final otherCommisionState = CommisionState(
            customProperty: 'My property 2',
          );
          expect(commisionState, isNot(equals(otherCommisionState)));

          expect(
            commisionState.copyWith(
              customProperty: otherCommisionState.customProperty,
            ),
            equals(otherCommisionState),
          );
        },
      );
    });
  });
}
