import 'package:animations/animations.dart';
import 'package:deshifarmer/presentation/pages/kpi/pages/view_kpi_page.dart';
import 'package:deshifarmer/presentation/pages/kpi/widgets/kpi_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

/// {@template kpi_page}
/// A description for KpiPage
/// {@endtemplate}
class KpiPage extends StatelessWidget {
  /// {@macro kpi_page}
  const KpiPage({super.key});

  /// The static route for KpiPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const KpiPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
      ),
      body: const KpiView(),
      bottomNavigationBar: OpenContainer(
        openColor: backgroundColor2,
        closedColor: backgroundColor2,
        openBuilder: (context, action) {
          return const ViewMyKPIPage();
        },
        closedBuilder: (context, action) {
          return SecondayButtonGreen(
            onpress: action,
            title: 'আমার কে পি আই',
          );
        },
      ),
    );
  }
}

/// Displays the Body of KpiView
class KpiView extends StatelessWidget {
  const KpiView({super.key});

  @override
  Widget build(BuildContext context) {
    return const KpiBody();
  }
}
