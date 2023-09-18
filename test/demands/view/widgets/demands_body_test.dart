// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/demands/demands.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DemandsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => DemandsBloc(),
          child: MaterialApp(home: DemandsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
