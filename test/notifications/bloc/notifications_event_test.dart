// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/notifications/bloc/bloc.dart';

void main() {
  group('NotificationsEvent', () {  
    group('CustomNotificationsEvent', () {
      test('supports value equality', () {
        expect(
          CustomNotificationsEvent(),
          equals(const CustomNotificationsEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomNotificationsEvent(),
          isNotNull
        );
      });
    });
  });
}
