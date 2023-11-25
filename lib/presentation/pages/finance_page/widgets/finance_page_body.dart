import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/finance_page/bloc/bloc.dart';

/// {@template finance_page_body}
/// Body of the FinancePagePage.
///
/// Add what it does
/// {@endtemplate}
class FinancePageBody extends StatelessWidget {
  /// {@macro finance_page_body}
  const FinancePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinancePageBloc, FinancePageState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
