// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/crop_insurance/crop_insurance.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CropInsuranceBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CropInsuranceBloc(),
          child: MaterialApp(home: CropInsuranceBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
