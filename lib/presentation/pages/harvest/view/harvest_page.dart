import 'package:deshifarmer/presentation/pages/harvest/widgets/harvest_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

/// {@template harvest_page}
/// A description for HarvestPage
/// {@endtemplate}
class HarvestPage extends StatelessWidget {
  /// {@macro harvest_page}
  const HarvestPage({super.key});

  /// The static route for HarvestPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HarvestPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
      ),
      body: const HarvestView(),
    );
  }
}

/// {@template harvest_view}
/// Displays the Body of HarvestView
/// {@endtemplate}
class HarvestView extends StatelessWidget {
  /// {@macro harvest_view}
  const HarvestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HarvestBody();
  }
}
