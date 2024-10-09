// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddFarmerBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AddFarmerBloc(),
          child: MaterialApp(home: AddFarmerBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
