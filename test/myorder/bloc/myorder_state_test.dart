// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/myorder/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyorderState', () {
    test('supports value equality', () {
      expect(
        MyorderState(),
        equals(
          const MyorderState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const MyorderState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const myorderState = MyorderState(
            customProperty: 'My property',
          );
          expect(
            myorderState.copyWith(),
            equals(myorderState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const myorderState = MyorderState(
            customProperty: 'My property',
          );
          final otherMyorderState = MyorderState(
            customProperty: 'My property 2',
          );
          expect(myorderState, isNot(equals(otherMyorderState)));

          expect(
            myorderState.copyWith(
              customProperty: otherMyorderState.customProperty,
            ),
            equals(otherMyorderState),
          );
        },
      );
    });
  });
}
