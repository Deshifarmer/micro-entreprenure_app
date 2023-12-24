// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/harvest/harvest.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HarvestPage', () {
    group('route', () {
      test('is routable', () {
        expect(HarvestPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders HarvestView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: HarvestPage()));
      expect(find.byType(HarvestView), findsOneWidget);
    });
  });
}
