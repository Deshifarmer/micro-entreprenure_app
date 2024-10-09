// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/order/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrderPage', () {
    group('route', () {
      test('is routable', () {
        expect(OrderPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders OrderView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: OrderPage()));
      expect(find.byType(OrderView), findsOneWidget);
    });
  });
}
