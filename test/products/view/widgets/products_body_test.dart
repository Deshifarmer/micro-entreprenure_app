// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/products/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ProductsBloc(),
          child: MaterialApp(home: ProductsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
