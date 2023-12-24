// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/notifications/bloc/bloc.dart';

void main() {
  group('NotificationsBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          NotificationsBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final notificationsBloc = NotificationsBloc();
      expect(notificationsBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<NotificationsBloc, NotificationsState>(
      'CustomNotificationsEvent emits nothing',
      build: NotificationsBloc.new,
      act: (bloc) => bloc.add(const CustomNotificationsEvent()),
      expect: () => <NotificationsState>[],
    );
  });
}
