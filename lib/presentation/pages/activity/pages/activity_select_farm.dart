import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/activity/components/farm_list_dropdown.dart';
import 'package:deshifarmer/presentation/pages/activity/components/farmer_list_dropdown.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/batch_list_page.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';

class ActivityAddFarm extends StatelessWidget {
  const ActivityAddFarm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final activityState = context.read<ActivityBloc>().state;
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        title: const Text('ট্র্যাক  কার্যকলাপ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(
              'assets/logo/activity_farm_1.png',
              width: MediaQuery.sizeOf(context).width / 2,
              height: 300,
            ),
            // AnimatedPositioned(
            //     child: Image.asset(
            //       'assets/logo/activity_farm_1.png',
            //       width: 100,
            //       height: 100,
            //     ),
            //     duration: 3.seconds),
            /* Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.asset(
                  'assets/logo/activity_farm_1.png',
                  width: 100,
                  height: 100,
                )
                    .animate()
                    .move(
                      duration: 800.milliseconds,
                      begin: const Offset(65, -1),
                      // end: Offset(65, -1),
                      end: const Offset(-65, 65),
                    )
                    .hide(),
                Image.asset(
                  'assets/logo/activity_farm_1.png',
                  width: 100,
                  height: 100,
                )
                    .animate(delay: 1.seconds)
                    .show()
                    .move(
                      duration: 1.seconds,
                      begin: const Offset(-65, 65),
                      // end: Offset(65, -1),
                      end: const Offset(65, 65 * 2),
                    )
                    .hide(),
                Image.asset(
                  'assets/logo/activity_farm_2.png',
                  width: 100,
                  height: 100,
                ).animate(delay: 2.seconds).move(
                    duration: 1.seconds,
                    begin: const Offset(65, 65 * 2),
                    end: const Offset(-65 * 2, 65 * 3)),
              ],
            ), */

            // const Spacer(),

            const Text(
              'ফার্ম সিলেক্ট করুন ',
              // 'Select Farm',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const FarmerListDropDown(),
            //! A dropdown of all farmers which has created by the USER
            const FarmListDropDown(),
          ],
        ),
      ),
      bottomNavigationBar: SecondayButtonGreen(
        btnColor: priceBoxColor,

        onpress: () {
          if (activityState is ActivityInitial) {
            if (activityState.farmerID.text.isEmpty) {
              // errorSnackBar('Select a farmer');
              ScaffoldMessenger.of(context)
                  .showSnackBar(errorSnackBar('Select a farmer'));
            } else if (activityState.farmID.text.isEmpty) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(errorSnackBar('Select Farm for this Farmer'));
            } else {
              print('get the farmer id -> ${activityState.farmerID.text}');
              print('get the farm id -> ${activityState.farmID.text}');

              Navigator.push(
                context,
                MaterialPageRoute<BatchListPage>(
                  builder: (context) => BatchListPage(
                    farmID: activityState.farmID.text,
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
          }
        },
        title: 'পরবর্তী ',
        // title: 'continue',
      ),
    );
  }
}
