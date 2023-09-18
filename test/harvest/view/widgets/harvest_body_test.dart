// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/harvest/harvest.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HarvestBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => HarvestBloc(),
          child: MaterialApp(home: HarvestBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
