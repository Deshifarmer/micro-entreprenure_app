// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/logistic/bloc/bloc.dart';

void main() {
  group('LogisticBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          LogisticBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final logisticBloc = LogisticBloc();
      expect(logisticBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<LogisticBloc, LogisticState>(
      'CustomLogisticEvent emits nothing',
      build: LogisticBloc.new,
      act: (bloc) => bloc.add(const CustomLogisticEvent()),
      expect: () => <LogisticState>[],
    );
  });
}
