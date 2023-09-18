// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/bloc/bloc.dart';

void main() {
  group('AgriAdvisoryEvent', () {  
    group('CustomAgriAdvisoryEvent', () {
      test('supports value equality', () {
        expect(
          CustomAgriAdvisoryEvent(),
          equals(const CustomAgriAdvisoryEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomAgriAdvisoryEvent(),
          isNotNull,
        );
      });
    });
  });
}
