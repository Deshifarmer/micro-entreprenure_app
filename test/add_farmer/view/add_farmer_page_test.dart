// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddFarmerPage', () {
    group('route', () {
      test('is routable', () {
        expect(AddFarmerPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AddFarmerView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddFarmerPage()));
      expect(find.byType(AddFarmerView), findsOneWidget);
    });
  });
}
