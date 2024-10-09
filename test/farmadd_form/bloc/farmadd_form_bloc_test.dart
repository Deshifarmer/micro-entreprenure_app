// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmaddFormBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          FarmaddFormBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final farmaddFormBloc = FarmaddFormBloc();
      expect(farmaddFormBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<FarmaddFormBloc, FarmaddFormState>(
      'CustomFarmaddFormEvent emits nothing',
      build: FarmaddFormBloc.new,
      act: (bloc) => bloc.add(const CustomFarmaddFormEvent()),
      expect: () => <FarmaddFormState>[],
    );
  });
}
