// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/commision/commision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CommisionBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => CommisionBloc(),
          child: MaterialApp(home: CommisionBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
