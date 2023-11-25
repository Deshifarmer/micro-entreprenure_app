// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/finance_page/finance_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinancePageBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => FinancePageBloc(),
          child: MaterialApp(home: FinancePageBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
