// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/logistic/logistic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LogisticPage', () {
    group('route', () {
      test('is routable', () {
        expect(LogisticPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders LogisticView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: LogisticPage()));
      expect(find.byType(LogisticView), findsOneWidget);
    });
  });
}
