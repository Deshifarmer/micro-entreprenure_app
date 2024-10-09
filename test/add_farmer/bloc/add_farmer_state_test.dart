// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddFarmerState', () {
    test('supports value equality', () {
      expect(
        AddFarmerState(),
        equals(
          const AddFarmerState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AddFarmerState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const addFarmerState = AddFarmerState(
            customProperty: 'My property',
          );
          expect(
            addFarmerState.copyWith(),
            equals(addFarmerState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const addFarmerState = AddFarmerState(
            customProperty: 'My property',
          );
          final otherAddFarmerState = AddFarmerState(
            customProperty: 'My property 2',
          );
          expect(addFarmerState, isNot(equals(otherAddFarmerState)));

          expect(
            addFarmerState.copyWith(
              customProperty: otherAddFarmerState.customProperty,
            ),
            equals(otherAddFarmerState),
          );
        },
      );
    });
  });
}
