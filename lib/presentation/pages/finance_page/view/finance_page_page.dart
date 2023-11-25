import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/finance_page/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/finance_page/widgets/finance_page_body.dart';

/// {@template finance_page_page}
/// A description for FinancePagePage
/// {@endtemplate}
class FinancePagePage extends StatelessWidget {
  /// {@macro finance_page_page}
  const FinancePagePage({super.key});

  /// The static route for FinancePagePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const FinancePagePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinancePageBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: FinancePageView(),
      ),
    );
  }
}

/// {@template finance_page_view}
/// Displays the Body of FinancePageView
/// {@endtemplate}
class FinancePageView extends StatelessWidget {
  /// {@macro finance_page_view}
  const FinancePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FinancePageBody();
  }
}
