// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/activity/bloc/bloc.dart';

void main() {
  group('ActivityState', () {
    test('supports value equality', () {
      expect(
        ActivityState(),
        equals(
          const ActivityState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ActivityState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const activityState = ActivityState(
            customProperty: 'My property',
          );
          expect(
            activityState.copyWith(),
            equals(activityState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const activityState = ActivityState(
            customProperty: 'My property',
          );
          final otherActivityState = ActivityState(
            customProperty: 'My property 2',
          );
          expect(activityState, isNot(equals(otherActivityState)));

          expect(
            activityState.copyWith(
              customProperty: otherActivityState.customProperty,
            ),
            equals(otherActivityState),
          );
        },
      );
    });
  });
}
