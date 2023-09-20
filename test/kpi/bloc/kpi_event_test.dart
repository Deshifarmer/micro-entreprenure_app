// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/kpi/bloc/bloc.dart';

void main() {
  group('KpiEvent', () {  
    group('CustomKpiEvent', () {
      test('supports value equality', () {
        expect(
          CustomKpiEvent(),
          equals(const CustomKpiEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomKpiEvent(),
          isNotNull,
        );
      });
    });
  });
}
