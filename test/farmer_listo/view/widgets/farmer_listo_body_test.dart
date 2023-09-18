// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/farmer_listo/farmer_listo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmerListoBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => FarmerListoBloc(),
          child: MaterialApp(home: FarmerListoBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
