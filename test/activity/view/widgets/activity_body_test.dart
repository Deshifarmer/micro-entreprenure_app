// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ActivityBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ActivityBloc(),
          child: MaterialApp(home: ActivityBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
