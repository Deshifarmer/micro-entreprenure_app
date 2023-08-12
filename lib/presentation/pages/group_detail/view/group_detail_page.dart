import 'package:deshifarmer/presentation/pages/group_detail/widgets/group_detail_body.dart';
import 'package:flutter/material.dart';

/// A description for GroupDetailPage
class GroupDetailPage extends StatelessWidget {
  const GroupDetailPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const GroupDetailPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('গ্রুপ এর বিবরণ'),
      ),
      body: const GroupDetailView(),
    );
  }
}

/// {@template group_detail_view}
/// Displays the Body of GroupDetailView
/// {@endtemplate}
class GroupDetailView extends StatelessWidget {
  /// {@macro group_detail_view}
  const GroupDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupDetailBody();
  }
}
