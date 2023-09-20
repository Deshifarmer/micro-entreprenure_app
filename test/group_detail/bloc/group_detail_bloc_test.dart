// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/add_group/pages/group_detail/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GroupDetailBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          GroupDetailBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final groupDetailBloc = GroupDetailBloc();
      expect(groupDetailBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<GroupDetailBloc, GroupDetailState>(
      'CustomGroupDetailEvent emits nothing',
      build: GroupDetailBloc.new,
      act: (bloc) => bloc.add(const CustomGroupDetailEvent()),
      expect: () => <GroupDetailState>[],
    );
  });
}
