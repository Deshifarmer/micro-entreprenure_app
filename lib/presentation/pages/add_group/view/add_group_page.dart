import 'package:deshifarmer/presentation/pages/add_group/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/add_group/widgets/add_group_body.dart';
import 'package:flutter/material.dart';

/// {@template add_group_page}
/// A description for AddGroupPage
/// {@endtemplate}
class AddGroupPage extends StatelessWidget {
  /// {@macro add_group_page}
  const AddGroupPage({super.key});

  /// The static route for AddGroupPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddGroupPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddGroupBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.navigate_before,
              color: Colors.green[600],
            ),
          ),
          title: Text(
            'গ্রুপ তৈরি করুন',
            style: TextStyle(
              color: Colors.green[700],
            ),
          ),
        ),
        body: const AddGroupView(),
      ),
    );
  }
}

/// {@template add_group_view}
/// Displays the Body of AddGroupView
/// {@endtemplate}
class AddGroupView extends StatelessWidget {
  /// {@macro add_group_view}
  const AddGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddGroupBody();
  }
}
