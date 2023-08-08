// ignore_for_file: prefer_const_constructors

import 'package:deshifarmer/presentation/pages/add_group/add_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddGroupPage', () {
    group('route', () {
      test('is routable', () {
        expect(AddGroupPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AddGroupView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddGroupPage()));
      expect(find.byType(AddGroupView), findsOneWidget);
    });
  });
}
