// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/finance_page/finance_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FinancePagePage', () {
    group('route', () {
      test('is routable', () {
        expect(FinancePagePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders FinancePageView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: FinancePagePage()));
      expect(find.byType(FinancePageView), findsOneWidget);
    });
  });
}
