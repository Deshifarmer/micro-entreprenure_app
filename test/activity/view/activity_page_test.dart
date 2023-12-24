// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ActivityPage', () {
    group('route', () {
      test('is routable', () {
        expect(ActivityPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ActivityView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ActivityPage()));
      expect(find.byType(ActivityView), findsOneWidget);
    });
  });
}
