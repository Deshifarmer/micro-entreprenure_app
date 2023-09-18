// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/farmer_profile/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmerProfileState', () {
    test('supports value equality', () {
      expect(
        FarmerProfileState(),
        equals(
          const FarmerProfileState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const FarmerProfileState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const farmerProfileState = FarmerProfileState(
            customProperty: 'My property',
          );
          expect(
            farmerProfileState.copyWith(),
            equals(farmerProfileState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const farmerProfileState = FarmerProfileState(
            customProperty: 'My property',
          );
          final otherFarmerProfileState = FarmerProfileState(
            customProperty: 'My property 2',
          );
          expect(farmerProfileState, isNot(equals(otherFarmerProfileState)));

          expect(
            farmerProfileState.copyWith(
              customProperty: otherFarmerProfileState.customProperty,
            ),
            equals(otherFarmerProfileState),
          );
        },
      );
    });
  });
}
