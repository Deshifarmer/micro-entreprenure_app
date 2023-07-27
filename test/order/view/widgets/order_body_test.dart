// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/order/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrderBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => OrderBloc(),
          child: MaterialApp(home: OrderBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
