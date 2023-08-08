// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/cartz/cartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CartzBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CartzBloc(),
          child: MaterialApp(home: CartzBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
