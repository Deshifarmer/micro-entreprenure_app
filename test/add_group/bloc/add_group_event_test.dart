// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/add_group/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddGroupEvent', () {  
    group('CustomAddGroupEvent', () {
      test('supports value equality', () {
        expect(
          CustomAddGroupEvent(),
          equals(const CustomAddGroupEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomAddGroupEvent(),
          isNotNull,
        );
      });
    });
  });
}
