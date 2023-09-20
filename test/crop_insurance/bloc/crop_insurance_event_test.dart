// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/crop_insurance/bloc/bloc.dart';

void main() {
  group('CropInsuranceEvent', () {  
    group('CustomCropInsuranceEvent', () {
      test('supports value equality', () {
        expect(
          CustomCropInsuranceEvent(),
          equals(const CustomCropInsuranceEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomCropInsuranceEvent(),
          isNotNull,
        );
      });
    });
  });
}
