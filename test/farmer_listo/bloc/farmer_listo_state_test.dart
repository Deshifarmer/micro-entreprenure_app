// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/farmer_listo/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmerListoState', () {
    test('supports value equality', () {
      expect(
        FarmerListoState(),
        equals(
          const FarmerListoState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const FarmerListoState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const farmerListoState = FarmerListoState(
            customProperty: 'My property',
          );
          expect(
            farmerListoState.copyWith(),
            equals(farmerListoState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const farmerListoState = FarmerListoState(
            customProperty: 'My property',
          );
          final otherFarmerListoState = FarmerListoState(
            customProperty: 'My property 2',
          );
          expect(farmerListoState, isNot(equals(otherFarmerListoState)));

          expect(
            farmerListoState.copyWith(
              customProperty: otherFarmerListoState.customProperty,
            ),
            equals(otherFarmerListoState),
          );
        },
      );
    });
  });
}
