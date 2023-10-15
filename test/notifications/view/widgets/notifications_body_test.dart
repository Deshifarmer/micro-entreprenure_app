// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/notifications/notifications.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => NotificationsBloc(),
          child: MaterialApp(home: NotificationsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
