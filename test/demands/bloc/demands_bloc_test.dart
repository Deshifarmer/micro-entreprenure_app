// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/demands/bloc/bloc.dart';

void main() {
  group('DemandsBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          DemandsBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final demandsBloc = DemandsBloc();
      expect(demandsBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<DemandsBloc, DemandsState>(
      'CustomDemandsEvent emits nothing',
      build: DemandsBloc.new,
      act: (bloc) => bloc.add(const CustomDemandsEvent()),
      expect: () => <DemandsState>[],
    );
  });
}
