import 'package:deshifarmer/presentation/pages/notifications/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/notifications/widgets/notifications_body.dart';
import 'package:flutter/material.dart';

/// {@template notifications_page}
/// A description for NotificationsPage
/// {@endtemplate}
class NotificationsPage extends StatelessWidget {
  /// {@macro notifications_page}
  const NotificationsPage({super.key});

  /// The static route for NotificationsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const NotificationsPage(),);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('বিজ্ঞপ্তি'),
        ),
        body: const NotificationsView(),
      ),
    );
  }
}

/// {@template notifications_view}
/// Displays the Body of NotificationsView
/// {@endtemplate}
class NotificationsView extends StatelessWidget {
  /// {@macro notifications_view}
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotificationsBody();
  }
}
