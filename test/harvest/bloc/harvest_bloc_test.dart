// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/harvest/bloc/bloc.dart';

void main() {
  group('HarvestBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          HarvestBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final harvestBloc = HarvestBloc();
      expect(harvestBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<HarvestBloc, HarvestState>(
      'CustomHarvestEvent emits nothing',
      build: HarvestBloc.new,
      act: (bloc) => bloc.add(const CustomHarvestEvent()),
      expect: () => <HarvestState>[],
    );
  });
}
