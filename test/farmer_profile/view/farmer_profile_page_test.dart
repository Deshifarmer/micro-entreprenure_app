// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/farmer_profile/farmer_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmerProfilePage', () {
    group('route', () {
      test('is routable', () {
        expect(FarmerProfilePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders FarmerProfileView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: FarmerProfilePage()));
      expect(find.byType(FarmerProfileView), findsOneWidget);
    });
  });
}
