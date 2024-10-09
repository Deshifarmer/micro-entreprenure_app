// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/bloc/bloc.dart';

void main() {
  group('AgriAdvisoryBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AgriAdvisoryBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final agriAdvisoryBloc = AgriAdvisoryBloc();
      expect(agriAdvisoryBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<AgriAdvisoryBloc, AgriAdvisoryState>(
      'CustomAgriAdvisoryEvent emits nothing',
      build: AgriAdvisoryBloc.new,
      act: (bloc) => bloc.add(const CustomAgriAdvisoryEvent()),
      expect: () => <AgriAdvisoryState>[],
    );
  });
}
