// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/myorder/myorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyorderPage', () {
    group('route', () {
      test('is routable', () {
        expect(MyorderPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders MyorderView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: MyorderPage()));
      expect(find.byType(MyorderView), findsOneWidget);
    });
  });
}
