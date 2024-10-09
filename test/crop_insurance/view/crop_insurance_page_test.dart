// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/crop_insurance/crop_insurance.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CropInsurancePage', () {
    group('route', () {
      test('is routable', () {
        expect(CropInsurancePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CropInsuranceView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CropInsurancePage()));
      expect(find.byType(CropInsuranceView), findsOneWidget);
    });
  });
}
