// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/add_group/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddGroupBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AddGroupBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final addGroupBloc = AddGroupBloc();
      expect(addGroupBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<AddGroupBloc, AddGroupState>(
      'CustomAddGroupEvent emits nothing',
      build: AddGroupBloc.new,
      act: (bloc) => bloc.add(const CustomAddGroupEvent()),
      expect: () => <AddGroupState>[],
    );
  });
}
