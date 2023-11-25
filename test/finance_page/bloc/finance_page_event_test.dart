// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/finance_page/bloc/bloc.dart';

void main() {
  group('FinancePageEvent', () {  
    group('CustomFinancePageEvent', () {
      test('supports value equality', () {
        expect(
          CustomFinancePageEvent(),
          equals(const CustomFinancePageEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomFinancePageEvent(),
          isNotNull
        );
      });
    });
  });
}
