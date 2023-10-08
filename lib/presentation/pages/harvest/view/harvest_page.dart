import 'package:animations/animations.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/harvest/pages/harvest_recod_page.dart';
import 'package:deshifarmer/presentation/pages/harvest/widgets/harvest_body.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 35,
        ),
        child: OpenContainer(
          closedBuilder: (c, f) {
            return SecondayButtonGreen(
              onpress: f,
              title: 'সেলস রেকর্ড করুন ',
            );
          },
          openElevation: 0,
          closedElevation: 0,
          closedColor: Colors.transparent,
          openColor: Colors.transparent,
          openBuilder: (c, f) {
            final loginState = context.read<LoginBloc>().state;
            final token = loginState is LoginSuccess
                ? loginState.successLoginEntity.token
                : '';

            context.read<MyFarmerBloc>().add(
                  MyFarmerFetchEvent(
                    token,
                  ),
                );
            return const HarvestRecordPage();
            // return HarvestRecordPage2();
          },
        ),
      ),
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
