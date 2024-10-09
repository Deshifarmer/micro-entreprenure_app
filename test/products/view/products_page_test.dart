// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/products/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductsPage', () {
    group('route', () {
      test('is routable', () {
        expect(ProductsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ProductsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ProductsPage()));
      expect(find.byType(ProductsView), findsOneWidget);
    });
  });
}
