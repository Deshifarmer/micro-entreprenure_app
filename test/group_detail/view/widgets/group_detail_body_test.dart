// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/add_group/pages/group_detail/group_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GroupDetailBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => GroupDetailBloc(),
          child: MaterialApp(home: GroupDetailBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
