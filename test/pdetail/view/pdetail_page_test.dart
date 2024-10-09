// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/pdetail/pdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PdetailPage', () {
    group('route', () {
      test('is routable', () {
        expect(PdetailPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders PdetailView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: PdetailPage()));
      expect(find.byType(PdetailView), findsOneWidget);
    });
  });
}
