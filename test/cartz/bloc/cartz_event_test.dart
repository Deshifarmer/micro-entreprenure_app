// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CartzEvent', () {  
    group('CustomCartzEvent', () {
      test('supports value equality', () {
        expect(
          CustomCartzEvent(),
          equals(const CustomCartzEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomCartzEvent(),
          isNotNull,
        );
      });
    });
  });
}
