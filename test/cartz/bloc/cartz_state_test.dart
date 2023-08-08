// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CartzState', () {
    test('supports value equality', () {
      expect(
        CartzState(),
        equals(
          const CartzState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CartzState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const cartzState = CartzState(
            customProperty: 'My property',
          );
          expect(
            cartzState.copyWith(),
            equals(cartzState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const cartzState = CartzState(
            customProperty: 'My property',
          );
          final otherCartzState = CartzState(
            customProperty: 'My property 2',
          );
          expect(cartzState, isNot(equals(otherCartzState)));

          expect(
            cartzState.copyWith(
              customProperty: otherCartzState.customProperty,
            ),
            equals(otherCartzState),
          );
        },
      );
    });
  });
}
