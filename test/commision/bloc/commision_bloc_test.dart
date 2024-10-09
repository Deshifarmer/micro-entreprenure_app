// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommisionBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          CommisionBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final commisionBloc = CommisionBloc();
      expect(commisionBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<CommisionBloc, CommisionState>(
      'CustomCommisionEvent emits nothing',
      build: CommisionBloc.new,
      act: (bloc) => bloc.add(const CustomCommisionEvent()),
      expect: () => <CommisionState>[],
    );
  });
}
