// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/farmadd_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FarmaddFormBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => FarmaddFormBloc(),
          child: MaterialApp(home: FarmaddFormBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
