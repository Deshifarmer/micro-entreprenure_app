import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/demands/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/demands/widgets/demands_body.dart';

/// {@template demands_page}
/// A description for DemandsPage
/// {@endtemplate}
class DemandsPage extends StatelessWidget {
  /// {@macro demands_page}
  const DemandsPage({super.key});

  /// The static route for DemandsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const DemandsPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
      ),
      body: DemandsView(),
    );
  }
}

/// {@template demands_view}
/// Displays the Body of DemandsView
/// {@endtemplate}
class DemandsView extends StatelessWidget {
  /// {@macro demands_view}
  const DemandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DemandsBody();
  }
}
