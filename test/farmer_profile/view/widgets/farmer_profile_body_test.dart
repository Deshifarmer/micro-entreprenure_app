// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/farmer_profile/farmer_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmerProfileBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => FarmerProfileBloc(),
          child: MaterialApp(home: FarmerProfileBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
