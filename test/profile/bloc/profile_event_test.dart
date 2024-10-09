// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfileEvent', () {  
    group('CustomProfileEvent', () {
      test('supports value equality', () {
        expect(
          CustomProfileEvent(),
          equals(const CustomProfileEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomProfileEvent(),
          isNotNull,
        );
      });
    });
  });
}
