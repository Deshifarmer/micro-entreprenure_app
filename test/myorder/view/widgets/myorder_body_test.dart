// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/myorder/myorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyorderBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => MyorderBloc(),
          child: MaterialApp(home: MyorderBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
