// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/add_group/pages/group_detail/bloc/bloc.dart';

void main() {
  group('GroupDetailEvent', () {  
    group('CustomGroupDetailEvent', () {
      test('supports value equality', () {
        expect(
          CustomGroupDetailEvent(),
          equals(const CustomGroupDetailEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomGroupDetailEvent(),
          isNotNull
        );
      });
    });
  });
}
