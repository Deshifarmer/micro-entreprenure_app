// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/notifications/bloc/bloc.dart';

void main() {
  group('NotificationsState', () {
    test('supports value equality', () {
      expect(
        NotificationsState(),
        equals(
          const NotificationsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const NotificationsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const notificationsState = NotificationsState(
            customProperty: 'My property',
          );
          expect(
            notificationsState.copyWith(),
            equals(notificationsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const notificationsState = NotificationsState(
            customProperty: 'My property',
          );
          final otherNotificationsState = NotificationsState(
            customProperty: 'My property 2',
          );
          expect(notificationsState, isNot(equals(otherNotificationsState)));

          expect(
            notificationsState.copyWith(
              customProperty: otherNotificationsState.customProperty,
            ),
            equals(otherNotificationsState),
          );
        },
      );
    });
  });
}
