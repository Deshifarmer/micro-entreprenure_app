// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/farmer_listo/farmer_listo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmerListoPage', () {
    group('route', () {
      test('is routable', () {
        expect(FarmerListoPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders FarmerListoView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: FarmerListoPage()));
      expect(find.byType(FarmerListoView), findsOneWidget);
    });
  });
}
