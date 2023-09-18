// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/demands/bloc/bloc.dart';

void main() {
  group('DemandsState', () {
    test('supports value equality', () {
      expect(
        DemandsState(),
        equals(
          const DemandsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const DemandsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const demandsState = DemandsState(
            customProperty: 'My property',
          );
          expect(
            demandsState.copyWith(),
            equals(demandsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const demandsState = DemandsState(
            customProperty: 'My property',
          );
          final otherDemandsState = DemandsState(
            customProperty: 'My property 2',
          );
          expect(demandsState, isNot(equals(otherDemandsState)));

          expect(
            demandsState.copyWith(
              customProperty: otherDemandsState.customProperty,
            ),
            equals(otherDemandsState),
          );
        },
      );
    });
  });
}
