// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/agri_advisory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AgriAdvisoryPage', () {
    group('route', () {
      test('is routable', () {
        expect(AgriAdvisoryPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AgriAdvisoryView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AgriAdvisoryPage()));
      expect(find.byType(AgriAdvisoryView), findsOneWidget);
    });
  });
}
