import 'package:deshifarmer/presentation/pages/activity/api/harvest_api.dart';
import 'package:deshifarmer/presentation/pages/harvest/view/harvest_farmer_select_paginate.dart';
import 'package:deshifarmer/presentation/pages/harvest/widgets/harvest_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
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
      bottomNavigationBar: isLoading
          ? SizedBox(
              height: getProportionateScreenHeight(50),
              width: getProportionateScreenWidth(50),
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

                final cropList = await HarvestAPI().getCropFromAnotherAPI();
                final units = await HarvestAPI().getUnitFromAnotherAPI();

                await showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return HarvestFarmerSelectPaginate(
                        cropList: cropList,
                        units: units,
                      );
                    });

                setState(() {
                  isLoading = false;
                });
              },
              title: 'সেলস রেকর্ড করুন ',
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
