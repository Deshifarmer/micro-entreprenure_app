// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/bloc/bloc.dart';

void main() {
  group('AgriAdvisoryState', () {
    test('supports value equality', () {
      expect(
        AgriAdvisoryState(),
        equals(
          const AgriAdvisoryState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AgriAdvisoryState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const agriAdvisoryState = AgriAdvisoryState(
            customProperty: 'My property',
          );
          expect(
            agriAdvisoryState.copyWith(),
            equals(agriAdvisoryState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const agriAdvisoryState = AgriAdvisoryState(
            customProperty: 'My property',
          );
          final otherAgriAdvisoryState = AgriAdvisoryState(
            customProperty: 'My property 2',
          );
          expect(agriAdvisoryState, isNot(equals(otherAgriAdvisoryState)));

          expect(
            agriAdvisoryState.copyWith(
              customProperty: otherAgriAdvisoryState.customProperty,
            ),
            equals(otherAgriAdvisoryState),
          );
        },
      );
    });
  });
}
