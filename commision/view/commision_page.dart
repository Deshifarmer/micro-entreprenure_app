import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/commision/widgets/commision_body.dart';
import 'package:flutter/material.dart';

/// {@template commision_page}
/// A description for CommisionPage
/// {@endtemplate}
class CommisionPage extends StatelessWidget {
  /// {@macro commision_page}
  const CommisionPage({super.key});

  /// The static route for CommisionPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CommisionPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommisionBloc(),
      child: const Scaffold(
        body: CommisionView(),
      ),
    );
  }    
}

/// {@template commision_view}
/// Displays the Body of CommisionView
/// {@endtemplate}
class CommisionView extends StatelessWidget {
  /// {@macro commision_view}
  const CommisionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommisionBody();
  }
}
