import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/activity/components/farm_list_dropdown.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/batch_list_page.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/components/select_farmer_for_activity_paginate.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:deshifarmer/services/blocs/farmer_fetch_farm/farmer_fetch_farm_bloc.dart';
import 'package:flutter/material.dart';

class ActivityAddFarm extends StatelessWidget {
  ActivityAddFarm({
    // required this.allFarmers,
    super.key,
  });
  // List<FarmerEntity> allFarmers;
  TextEditingController farmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final activityState = context.watch<ActivityBloc>().state;
    return WillPopScope(
      onWillPop: () async {
        debugPrint('called on will pop AC');
        context.read<ActivityBloc>().add(const CustomActivityEvent());
        context.read<FarmerFetchFarmBloc>().add(const FarmResetEvent());
        return true;
      },
      child: Scaffold(
        backgroundColor: backgroundColor2,
        appBar: AppBar(
          backgroundColor: backgroundColor2,
          title: const Text('ট্র্যাক  কার্যকলাপ'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/logo/activity_farm_1.png',
                  width: MediaQuery.sizeOf(context).width / 2,
                  height: 300,
                ),
              ),
              // AnimatedPositioned(
              //     child: Image.asset(
              //       'assets/logo/activity_farm_1.png',
              //       width: 100,
              //       height: 100,
              //     ),
              //     duration: 3.seconds),

              Text(
                'ফার্ম সিলেক্ট করুন ',
                // 'Select Farm',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    // fontSize: 20,
                    // fontWeight: FontWeight.w600,
                    ),
              ),
              BlocConsumer<ActivityBloc, ActivityState>(
                listener: (context, state) {
                  debugPrint('Activity consumer called -> $state');
                },
                builder: (context, state) {
                  if (state is ActivityFarmerAddState) {
                    debugPrint(
                        'ActivityFarmerAddState farmer -> ${state.farmerEntity.full_name}');
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return const SelectFarmerPaginateForActivity();
                            },
                          );
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            checkDomain(Strings.getServerOrLocal(
                                    ServerOrLocal.server))
                                ? dummyImage
                                : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${state.farmerEntity.image}',
                            height: 40,
                            width: 40,
                            errorBuilder: (
                              context,
                              error,
                              stackTrace,
                            ) {
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                        title: Text(state.farmerEntity.full_name ?? ''),
                        subtitle: Text(state.farmerEntity.phone ?? ''),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        onTap: () async {
                          await showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return const SelectFarmerPaginateForActivity();
                            },
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        tileColor: Colors.white,
                        leading: const Icon(Icons.person),
                        title: const Text('ফার্মার সিলেক্ট করুন'),
                      ),
                    );
                  }
                },
              ),
              // const SelectFarmerForTrack(),
              //! A dropdown of all farmers which has created by the USER
              FarmListDropDown(
                farmController: farmController,
              ),
            ],
          ),
        ),
        bottomNavigationBar: SecondayButtonGreen(
          btnColor: priceBoxColor,

          onpress: () {
            if (activityState is ActivityFarmerAddState) {
              if (farmController.text.isEmpty) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(errorSnackBar('খামার নির্বাচন করুন'));
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute<BatchListPage>(
                    builder: (context) => BatchListPage(
                      farmID: farmController.text,
                      farmerID: activityState.farmerEntity.farmer_id ?? '',
                      // farmerID: activityState.farmerID.text,
                    ),
                  ),
                );
                /* Navigator.push(
                  context,
                  MaterialPageRoute<ActivityTypeSelection>(
                    builder: (context) => ActivityTypeSelection(
                      farmID: activityState.farmID.text,
                      farmerID: activityState.farmerID.text,
                    ),
                  ),
                ); */
              }
            } else {
              // errorSnackBar('Select a farmer');
              ScaffoldMessenger.of(context)
                  .showSnackBar(errorSnackBar('কৃষক সিলেক্ট করুন'));
            }
          },
          title: 'পরবর্তী ',
          // title: 'continue',
        ),
      ),
    );
  }
}
