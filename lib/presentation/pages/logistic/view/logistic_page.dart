import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/logistic/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/logistic/widgets/logistic_body.dart';

/// {@template logistic_page}
/// A description for LogisticPage
/// {@endtemplate}
class LogisticPage extends StatelessWidget {
  /// {@macro logistic_page}
  const LogisticPage({super.key});

  /// The static route for LogisticPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LogisticPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
      ),
      body: const LogisticView(),
    );
  }
}

/// {@template logistic_view}
/// Displays the Body of LogisticView
/// {@endtemplate}
class LogisticView extends StatelessWidget {
  /// {@macro logistic_view}
  const LogisticView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LogisticBody();
  }
}
