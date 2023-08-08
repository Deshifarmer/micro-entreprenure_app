// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddFarmerBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AddFarmerBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final addFarmerBloc = AddFarmerBloc();
      expect(addFarmerBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<AddFarmerBloc, AddFarmerState>(
      'CustomAddFarmerEvent emits nothing',
      build: AddFarmerBloc.new,
      act: (bloc) => bloc.add(const CustomAddFarmerEvent()),
      expect: () => <AddFarmerState>[],
    );
  });
}
