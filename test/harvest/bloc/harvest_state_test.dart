// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/harvest/bloc/bloc.dart';

void main() {
  group('HarvestState', () {
    test('supports value equality', () {
      expect(
        HarvestState(),
        equals(
          const HarvestState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const HarvestState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const harvestState = HarvestState(
            customProperty: 'My property',
          );
          expect(
            harvestState.copyWith(),
            equals(harvestState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const harvestState = HarvestState(
            customProperty: 'My property',
          );
          final otherHarvestState = HarvestState(
            customProperty: 'My property 2',
          );
          expect(harvestState, isNot(equals(otherHarvestState)));

          expect(
            harvestState.copyWith(
              customProperty: otherHarvestState.customProperty,
            ),
            equals(otherHarvestState),
          );
        },
      );
    });
  });
}
