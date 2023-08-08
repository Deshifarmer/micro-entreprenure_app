// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CartzBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CartzBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final cartzBloc = CartzBloc();
      expect(cartzBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<CartzBloc, CartzState>(
      'CustomCartzEvent emits nothing',
      build: CartzBloc.new,
      act: (bloc) => bloc.add(const CustomCartzEvent()),
      expect: () => <CartzState>[],
    );
  });
}
