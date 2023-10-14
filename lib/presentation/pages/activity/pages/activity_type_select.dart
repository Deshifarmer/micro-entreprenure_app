import 'package:deshifarmer/data/datasources/remote/apis/harvest_api.dart';
import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/record_sowing_activity.dart';
import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
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
          ? LoadDiffDataButton(
              activityTypes: _activityTypes,
              bactchID: widget.batchID,
            )
          : null,
    );
  }
}

class LoadDiffDataButton extends StatefulWidget {
  const LoadDiffDataButton({
    required this.bactchID,
    required this.activityTypes,
    super.key,
  });
  final String bactchID;
  final String activityTypes;

  @override
  State<LoadDiffDataButton> createState() => _LoadDiffDataButtonState();
}

class _LoadDiffDataButtonState extends State<LoadDiffDataButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: const PrimaryLoadingIndicator(),
          )
        : SecondayButtonGreen(
            btnColor: priceBoxColor,
            onpress: () async {
              setState(() {
                isLoading = true;
              });
              if (activityRecordValues[widget.activityTypes]! ==
                  ActivityTypeEnums.sowing) {
                debugPrint('sowin activity');
                final harvAPI = HarvestAPI();
                final prods = await harvAPI.getKrishProd();

                debugPrint('products L -> ${prods?.length}');
                // RecordSowingActivity
                await Navigator.push(
                  context,
                  PageAnimationWrapper.sharedAxisTransitionPageWrapper(
                    RecordSowingActivity(
                      krishibebshaProd: prods,
                      recordName: widget.activityTypes,
                      batchID: widget.bactchID,
                    ),
                  ),
                );
                setState(() {
                  isLoading = false;
                });
                return;
              }
              await Navigator.push(
                context,
                PageAnimationWrapper.sharedAxisTransitionPageWrapper(
                  RecordSowingActivity(
                    krishibebshaProd: null,
                    recordName: widget.activityTypes,
                    batchID: widget.bactchID,
                  ),
                ),
              );
              setState(() {
                isLoading = false;
              });
            },
            title: 'চালিয়ে যান',
            // title: 'continue',
          );
  }
}
