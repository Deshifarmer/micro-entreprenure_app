import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:flutter/material.dart';

/// {@template commision_body}
/// Body of the CommisionPage.
///
/// Add what it does
/// {@endtemplate}
class CommisionBody extends StatelessWidget {
  /// {@macro commision_body}
  const CommisionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommisionBloc, CommisionState>(
      builder: (context, state) {
        return const Center(child: Text('commision page'));
      },
    );
  }
}
