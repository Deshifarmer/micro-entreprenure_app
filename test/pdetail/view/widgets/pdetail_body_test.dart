// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/pdetail/pdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PdetailBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => PdetailBloc(),
          child: MaterialApp(home: PdetailBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
