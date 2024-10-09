// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/pdetail/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PdetailEvent', () {  
    group('CustomPdetailEvent', () {
      test('supports value equality', () {
        expect(
          CustomPdetailEvent(),
          equals(const CustomPdetailEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomPdetailEvent(),
          isNotNull,
        );
      });
    });
  });
}
