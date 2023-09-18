// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/kpi/bloc/bloc.dart';

void main() {
  group('KpiBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          KpiBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final kpiBloc = KpiBloc();
      expect(kpiBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<KpiBloc, KpiState>(
      'CustomKpiEvent emits nothing',
      build: KpiBloc.new,
      act: (bloc) => bloc.add(const CustomKpiEvent()),
      expect: () => <KpiState>[],
    );
  });
}
