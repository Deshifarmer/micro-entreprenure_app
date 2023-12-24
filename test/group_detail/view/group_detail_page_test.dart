// ignore_for_file: prefer_const_constructors
import 'package:deshifarmer/presentation/pages/group_detail/view/group_detail_page.dart';
import 'package:flutter/material.dart';
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
