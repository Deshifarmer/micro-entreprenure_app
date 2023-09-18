// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/crop_insurance/bloc/bloc.dart';

void main() {
  group('CropInsuranceState', () {
    test('supports value equality', () {
      expect(
        CropInsuranceState(),
        equals(
          const CropInsuranceState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CropInsuranceState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const cropInsuranceState = CropInsuranceState(
            customProperty: 'My property',
          );
          expect(
            cropInsuranceState.copyWith(),
            equals(cropInsuranceState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const cropInsuranceState = CropInsuranceState(
            customProperty: 'My property',
          );
          final otherCropInsuranceState = CropInsuranceState(
            customProperty: 'My property 2',
          );
          expect(cropInsuranceState, isNot(equals(otherCropInsuranceState)));

          expect(
            cropInsuranceState.copyWith(
              customProperty: otherCropInsuranceState.customProperty,
            ),
            equals(otherCropInsuranceState),
          );
        },
      );
    });
  });
}
