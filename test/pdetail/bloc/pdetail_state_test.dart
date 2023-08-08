// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/pdetail/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PdetailState', () {
    test('supports value equality', () {
      expect(
        PdetailState(),
        equals(
          const PdetailState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const PdetailState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const pdetailState = PdetailState(
            customProperty: 'My property',
          );
          expect(
            pdetailState.copyWith(),
            equals(pdetailState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const pdetailState = PdetailState(
            customProperty: 'My property',
          );
          final otherPdetailState = PdetailState(
            customProperty: 'My property 2',
          );
          expect(pdetailState, isNot(equals(otherPdetailState)));

          expect(
            pdetailState.copyWith(
              customProperty: otherPdetailState.customProperty,
            ),
            equals(otherPdetailState),
          );
        },
      );
    });
  });
}
