// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommisionEvent', () {  
    group('CustomCommisionEvent', () {
      test('supports value equality', () {
        expect(
          CustomCommisionEvent(),
          equals(const CustomCommisionEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomCommisionEvent(),
          isNotNull,
        );
      });
    });
  });
}
