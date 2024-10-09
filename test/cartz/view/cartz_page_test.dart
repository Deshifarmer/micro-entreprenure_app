// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/cartz/cartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CartzPage', () {
    group('route', () {
      test('is routable', () {
        expect(CartzPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CartzView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CartzPage()));
      expect(find.byType(CartzView), findsOneWidget);
    });
  });
}
