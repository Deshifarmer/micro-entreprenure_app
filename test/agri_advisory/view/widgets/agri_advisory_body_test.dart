// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/agri_advisory.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AgriAdvisoryBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AgriAdvisoryBloc(),
          child: MaterialApp(home: AgriAdvisoryBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
