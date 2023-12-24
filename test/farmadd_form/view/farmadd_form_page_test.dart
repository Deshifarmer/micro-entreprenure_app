// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/farmadd_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmaddFormPage', () {
    group('route', () {
      test('is routable', () {
        expect(FarmaddFormPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders FarmaddFormView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: FarmaddFormPage()));
      expect(find.byType(FarmaddFormView), findsOneWidget);
    });
  });
}
