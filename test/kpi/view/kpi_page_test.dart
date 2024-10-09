// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/kpi/kpi.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('KpiPage', () {
    group('route', () {
      test('is routable', () {
        expect(KpiPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders KpiView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: KpiPage()));
      expect(find.byType(KpiView), findsOneWidget);
    });
  });
}
