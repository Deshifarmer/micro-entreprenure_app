// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/finance_page/bloc/bloc.dart';

void main() {
  group('FinancePageBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          FinancePageBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final financePageBloc = FinancePageBloc();
      expect(financePageBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<FinancePageBloc, FinancePageState>(
      'CustomFinancePageEvent emits nothing',
      build: FinancePageBloc.new,
      act: (bloc) => bloc.add(const CustomFinancePageEvent()),
      expect: () => <FinancePageState>[],
    );
  });
}
