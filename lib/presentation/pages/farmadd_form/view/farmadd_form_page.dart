import 'package:deshifarmer/presentation/pages/farmadd_form/widgets/farmadd_form_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

/// {@template farmadd_form_page}
/// A description for FarmaddFormPage
/// {@endtemplate}
class FarmaddFormPage extends StatelessWidget {
  /// {@macro farmadd_form_page}
  const FarmaddFormPage({super.key});

  /// The static route for FarmaddFormPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const FarmaddFormPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Farm'),
        surfaceTintColor: backgroundColor2,
      ),
      body: const FarmaddFormView(),
    );
  }
}

/// Displays the Body of FarmaddFormView
class FarmaddFormView extends StatelessWidget {
  /// {@macro farmadd_form_view}
  const FarmaddFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FarmaddFormBody();
  }
}
