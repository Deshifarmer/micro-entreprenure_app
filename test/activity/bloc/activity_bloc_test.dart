// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/activity/bloc/bloc.dart';

void main() {
  group('ActivityBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ActivityBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final activityBloc = ActivityBloc();
      expect(activityBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<ActivityBloc, ActivityState>(
      'CustomActivityEvent emits nothing',
      build: ActivityBloc.new,
      act: (bloc) => bloc.add(const CustomActivityEvent()),
      expect: () => <ActivityState>[],
    );
  });
}
