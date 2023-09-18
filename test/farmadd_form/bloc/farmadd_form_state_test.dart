// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/bloc/bloc.dart';

void main() {
  group('FarmaddFormState', () {
    test('supports value equality', () {
      expect(
        FarmaddFormState(),
        equals(
          const FarmaddFormState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const FarmaddFormState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const farmaddFormState = FarmaddFormState(
            customProperty: 'My property',
          );
          expect(
            farmaddFormState.copyWith(),
            equals(farmaddFormState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const farmaddFormState = FarmaddFormState(
            customProperty: 'My property',
          );
          final otherFarmaddFormState = FarmaddFormState(
            customProperty: 'My property 2',
          );
          expect(farmaddFormState, isNot(equals(otherFarmaddFormState)));

          expect(
            farmaddFormState.copyWith(
              customProperty: otherFarmaddFormState.customProperty,
            ),
            equals(otherFarmaddFormState),
          );
        },
      );
    });
  });
}
