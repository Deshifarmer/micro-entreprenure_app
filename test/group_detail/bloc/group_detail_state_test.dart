// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/add_group/pages/group_detail/bloc/bloc.dart';

void main() {
  group('GroupDetailState', () {
    test('supports value equality', () {
      expect(
        GroupDetailState(),
        equals(
          const GroupDetailState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const GroupDetailState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const groupDetailState = GroupDetailState(
            customProperty: 'My property',
          );
          expect(
            groupDetailState.copyWith(),
            equals(groupDetailState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const groupDetailState = GroupDetailState(
            customProperty: 'My property',
          );
          final otherGroupDetailState = GroupDetailState(
            customProperty: 'My property 2',
          );
          expect(groupDetailState, isNot(equals(otherGroupDetailState)));

          expect(
            groupDetailState.copyWith(
              customProperty: otherGroupDetailState.customProperty,
            ),
            equals(otherGroupDetailState),
          );
        },
      );
    });
  });
}
