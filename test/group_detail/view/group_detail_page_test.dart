// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/add_group/pages/group_detail/group_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GroupDetailPage', () {
    group('route', () {
      test('is routable', () {
        expect(GroupDetailPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders GroupDetailView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: GroupDetailPage()));
      expect(find.byType(GroupDetailView), findsOneWidget);
    });
  });
}
