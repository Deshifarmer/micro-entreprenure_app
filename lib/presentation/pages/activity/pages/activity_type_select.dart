import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/record_sowing_activity.dart';
import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

class ActivityTypeSelection extends StatefulWidget {
  const ActivityTypeSelection({
    required this.batchID,
    super.key,
  });

  final String batchID;

  @override
  State<ActivityTypeSelection> createState() => _ActivityTypeSelectionState();
}

class _ActivityTypeSelectionState extends State<ActivityTypeSelection> {
  String _activityTypes = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
      ),
      body: Column(
        children: [
          const Center(
            child: Text(
              'কার্যকলাপের ধরন নির্বাচন করুন',
              // 'Select Type of Activity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              for (final String s in activityRecordValues.keys)
                FilterChip(
                  selectedColor: priceBoxColor,
                  label: Text(
                    s,
                    style: TextStyle(
                      color: _activityTypes.contains(s)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  onSelected: (bool isSelected) {
                    // if (isSelected) {
                    //   _activityTypes.add(s);
                    // } else {
                    //   _activityTypes.remove(s);
                    // }
                    _activityTypes = s;
                    setState(() {});
                  },
                  selected: _activityTypes.contains(s),
                ),
            ],
          ),
          // list of filter chip
        ],
      ),
      bottomNavigationBar: _activityTypes.isNotEmpty
          ? SecondayButtonGreen(
              btnColor: priceBoxColor,
              onpress: () {
                debugPrint('list of types -> $_activityTypes');
// RecordSowingActivity
                Navigator.push(
                  context,
                  PageAnimationWrapper.sharedAxisTransitionPageWrapper(
                    RecordSowingActivity(
                      // activityTypes: _activityTypes,
                      recordName: _activityTypes,
                      batchID: widget.batchID,
                      // farmerID: widget.farmerID,
                      // farmID: widget.farmID,
                    ),
                  ),
                );
              },
              title: 'চালিয়ে যান',
              // title: 'continue',
            )
          : null,
    );
  }
}

// List<String> listOfActivities = [
//   'sowing',
//   'using chemials',
//   'irrigation',
//   'hervest',
//   'regular advisory',
//   'report problem',
//   'little problem',
// ];
