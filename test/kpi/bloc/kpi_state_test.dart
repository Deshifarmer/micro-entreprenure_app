// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/kpi/bloc/bloc.dart';

void main() {
  group('KpiState', () {
    test('supports value equality', () {
      expect(
        KpiState(),
        equals(
          const KpiState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const KpiState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const kpiState = KpiState(
            customProperty: 'My property',
          );
          expect(
            kpiState.copyWith(),
            equals(kpiState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const kpiState = KpiState(
            customProperty: 'My property',
          );
          final otherKpiState = KpiState(
            customProperty: 'My property 2',
          );
          expect(kpiState, isNot(equals(otherKpiState)));

          expect(
            kpiState.copyWith(
              customProperty: otherKpiState.customProperty,
            ),
            equals(otherKpiState),
          );
        },
      );
    });
  });
}
