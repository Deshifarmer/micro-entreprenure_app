// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrderBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          OrderBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final orderBloc = OrderBloc();
      expect(orderBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<OrderBloc, OrderState>(
      'CustomOrderEvent emits nothing',
      build: OrderBloc.new,
      act: (bloc) => bloc.add(const CustomOrderEvent()),
      expect: () => <OrderState>[],
    );
  });
}
