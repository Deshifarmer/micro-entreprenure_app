// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/add_group/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddGroupState', () {
    test('supports value equality', () {
      expect(
        AddGroupState(),
        equals(
          const AddGroupState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AddGroupState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const addGroupState = AddGroupState(
            customProperty: 'My property',
          );
          expect(
            addGroupState.copyWith(),
            equals(addGroupState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const addGroupState = AddGroupState(
            customProperty: 'My property',
          );
          final otherAddGroupState = AddGroupState(
            customProperty: 'My property 2',
          );
          expect(addGroupState, isNot(equals(otherAddGroupState)));

          expect(
            addGroupState.copyWith(
              customProperty: otherAddGroupState.customProperty,
            ),
            equals(otherAddGroupState),
          );
        },
      );
    });
  });
}
