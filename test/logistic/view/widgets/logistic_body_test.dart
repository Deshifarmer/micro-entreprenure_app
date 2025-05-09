// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/logistic/logistic.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LogisticBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => LogisticBloc(),
          child: MaterialApp(home: LogisticBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
