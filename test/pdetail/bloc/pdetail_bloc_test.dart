// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/pdetail/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PdetailBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          PdetailBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final pdetailBloc = PdetailBloc();
      expect(pdetailBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<PdetailBloc, PdetailState>(
      'CustomPdetailEvent emits nothing',
      build: PdetailBloc.new,
      act: (bloc) => bloc.add(const CustomPdetailEvent()),
      expect: () => <PdetailState>[],
    );
  });
}
