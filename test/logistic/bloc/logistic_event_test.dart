// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/logistic/bloc/bloc.dart';

void main() {
  group('LogisticEvent', () {  
    group('CustomLogisticEvent', () {
      test('supports value equality', () {
        expect(
          CustomLogisticEvent(),
          equals(const CustomLogisticEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomLogisticEvent(),
          isNotNull,
        );
      });
    });
  });
}
