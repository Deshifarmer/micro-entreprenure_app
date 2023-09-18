// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/farmer_profile/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmerProfileBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          FarmerProfileBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final farmerProfileBloc = FarmerProfileBloc();
      expect(farmerProfileBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<FarmerProfileBloc, FarmerProfileState>(
      'CustomFarmerProfileEvent emits nothing',
      build: FarmerProfileBloc.new,
      act: (bloc) => bloc.add(const CustomFarmerProfileEvent()),
      expect: () => <FarmerProfileState>[],
    );
  });
}
