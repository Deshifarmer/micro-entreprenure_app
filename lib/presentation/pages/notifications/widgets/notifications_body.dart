import 'package:deshifarmer/presentation/pages/notifications/bloc/bloc.dart';
import 'package:flutter/material.dart';

/// {@template notifications_body}
/// Body of the NotificationsPage.
///
/// Add what it does
/// {@endtemplate}
class NotificationsBody extends StatelessWidget {
  /// {@macro notifications_body}
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
