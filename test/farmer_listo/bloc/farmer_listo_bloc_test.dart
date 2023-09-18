// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmerListoBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          FarmerListoBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final farmerListoBloc = FarmerListoBloc();
      expect(farmerListoBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<FarmerListoBloc, FarmerListoState>(
      'CustomFarmerListoEvent emits nothing',
      build: FarmerListoBloc.new,
      act: (bloc) => bloc.add(const CustomFarmerListoEvent()),
      expect: () => <FarmerListoState>[],
    );
  });
}
