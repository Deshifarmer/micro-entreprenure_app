// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/add_group/add_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddGroupBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AddGroupBloc(),
          child: MaterialApp(home: AddGroupBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
