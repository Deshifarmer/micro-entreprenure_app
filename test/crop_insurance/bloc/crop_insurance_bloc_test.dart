// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/crop_insurance/bloc/bloc.dart';

void main() {
  group('CropInsuranceBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CropInsuranceBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final cropInsuranceBloc = CropInsuranceBloc();
      expect(cropInsuranceBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<CropInsuranceBloc, CropInsuranceState>(
      'CustomCropInsuranceEvent emits nothing',
      build: CropInsuranceBloc.new,
      act: (bloc) => bloc.add(const CustomCropInsuranceEvent()),
      expect: () => <CropInsuranceState>[],
    );
  });
}
