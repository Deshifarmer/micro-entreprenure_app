import 'dart:isolate';

import 'package:animations/animations.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/crop_entity/single_crop_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/harvest/pages/harvest_recod_page.dart';
import 'package:deshifarmer/presentation/pages/harvest/pages/harvest_record_page2.dart';
import 'package:deshifarmer/presentation/pages/harvest/widgets/harvest_body.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

/// {@template harvest_page}
/// A description for HarvestPage
/// {@endtemplate}
class HarvestPage extends StatefulWidget {
  /// {@macro harvest_page}
  const HarvestPage({super.key});

  /// The static route for HarvestPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HarvestPage());
  }

  @override
  State<HarvestPage> createState() => _HarvestPageState();
}

class _HarvestPageState extends State<HarvestPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
      ),
      body: const HarvestView(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 35,
        ),
        child: isLoading
            ? SizedBox(
                height: 50,
                width: 50,
                child: const Center(
                  child: PrimaryLoadingIndicator(),
                ),
              )
            : SecondayButtonGreen(
                onpress: () async {
                  if (isLoading) {
                    return;
                  }
                  setState(() {
                    isLoading = true;
                  });
                  final loginState = context.read<LoginBloc>().state;
                  final token = loginState is LoginSuccess
                      ? loginState.successLoginEntity.token
                      : '';
                  final allFarmerListResp =
                      await DeshiFarmerAPI().getFarmers2(token);

                  final cropList =
                      await DeshiFarmerAPI().getCropFromAnotherAPI();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HarvestRecordPage2(
                        crops: cropList,
                        allFarmerListResp: allFarmerListResp,
                      ),
                    ),
                  );

                  setState(() {
                    isLoading = false;
                  });
                },
                title: 'সেলস রেকর্ড করুন ',
              ),
      ),
    );
  }
}

class ShowLoadingOnButtonHarvest extends StatefulWidget {
  const ShowLoadingOnButtonHarvest({
    super.key,
  });

  @override
  State<ShowLoadingOnButtonHarvest> createState() =>
      _ShowLoadingOnButtonHarvestState();
}

class _ShowLoadingOnButtonHarvestState
    extends State<ShowLoadingOnButtonHarvest> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SecondayButtonGreen(
            onpress: () async {
              if (isLoading) {
                return;
              }
              setState(() {
                isLoading = true;
              });
              final loginState = context.read<LoginBloc>().state;
              final token = loginState is LoginSuccess
                  ? loginState.successLoginEntity.token
                  : '';
              final allFarmerListResp =
                  await DeshiFarmerAPI().getFarmers2(token);

              final cropList = await DeshiFarmerAPI().getCropFromAnotherAPI();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HarvestRecordPage2(
                    crops: cropList,
                    allFarmerListResp: allFarmerListResp,
                  ),
                ),
              );

              setState(() {
                isLoading = false;
              });
            },
            title: 'সেলস রেকর্ড করুন ',
          )
        : const Center(
            child: PrimaryLoadingIndicator(),
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
