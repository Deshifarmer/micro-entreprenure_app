// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/commision/commision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommisionPage', () {
    group('route', () {
      test('is routable', () {
        expect(CommisionPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders CommisionView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: CommisionPage()));
      expect(find.byType(CommisionView), findsOneWidget);
    });
  });
}
