// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/notifications/notifications.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationsPage', () {
    group('route', () {
      test('is routable', () {
        expect(NotificationsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders NotificationsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: NotificationsPage()));
      expect(find.byType(NotificationsView), findsOneWidget);
    });
  });
}
