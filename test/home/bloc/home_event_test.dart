// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/home/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeEvent', () {  
    group('CustomHomeEvent', () {
      test('supports value equality', () {
        expect(
          CustomHomeEvent(),
          equals(const CustomHomeEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomHomeEvent(),
          isNotNull,
        );
      });
    });
  });
}
