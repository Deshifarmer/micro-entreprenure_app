// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/kpi/kpi.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('KpiBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => KpiBloc(),
          child: MaterialApp(home: KpiBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
