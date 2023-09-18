// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/demands/demands.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DemandsPage', () {
    group('route', () {
      test('is routable', () {
        expect(DemandsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders DemandsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: DemandsPage()));
      expect(find.byType(DemandsView), findsOneWidget);
    });
  });
}
