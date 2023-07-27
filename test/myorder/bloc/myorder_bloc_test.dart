// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/myorder/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyorderBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          MyorderBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final myorderBloc = MyorderBloc();
      expect(myorderBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<MyorderBloc, MyorderState>(
      'CustomMyorderEvent emits nothing',
      build: MyorderBloc.new,
      act: (bloc) => bloc.add(const CustomMyorderEvent()),
      expect: () => <MyorderState>[],
    );
  });
}
