import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/batch/batch_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/viewbatch/view_batches.dart';
// ignore: unused_import
import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:flutter/material.dart';

class FolonBatchData extends StatelessWidget {
  const FolonBatchData({
    required this.token,
    required this.farmID,
    super.key,
  });
  final String token;
  final String farmID;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DeshiFarmerAPI().getFarmBatches(token: token, farmID: farmID),
      builder: (c, AsyncSnapshot<List<BatchEnity>?> snapshot) {
        if (snapshot.hasData) {
          return Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            children: [
              for (final s in snapshot.data!)
                FilterChip(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.transparent,
                  ),
                  selectedColor: priceBoxColor,
                  selectedShadowColor: Colors.pink,
                  surfaceTintColor: Colors.green,
                  // backgroundColor: Colors.cyan,
                  shadowColor: Colors.indigo,
                  disabledColor: Colors.brown,
                  // color: const MaterialStatePropertyAll(Colors.white),
                  label: Text(
                    s.season,
                    style: const TextStyle(
                        // color: s == currentBatch ? Colors.white : Colors.black,
                        ),
                  ),
                  onSelected: (bool isSelected) {
                    if (isSelected) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewBatchData(
                            batchEnity: s,
                          ),
                        ),
                      );
                    }
                    // if (isSelected) {
                    // _activityTypes.add(s);
                    // currentBatch = s;
                    // } else {
                    // print('btn pressed -> $currentBatch $s');
                    //   _activityTypes.remove(s);
                    // }
                    // setState(() {});
                  },
                  // selected: s == currentBatch,
                ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: PrimaryLoadingIndicator(),
          );
        }
        return const SizedBox.shrink();
      },
    );
    // return Wrap(
    //   alignment: WrapAlignment.center,
    //   spacing: 10,
    //   children: [
    //     for (final s in activityRecordValues.keys)
    //       FilterChip(
    //         backgroundColor: Colors.white,
    //         side: const BorderSide(
    //           color: Colors.transparent,
    //         ),
    //         selectedColor: priceBoxColor,
    //         selectedShadowColor: Colors.pink,
    //         surfaceTintColor: Colors.green,
    //         // backgroundColor: Colors.cyan,
    //         shadowColor: Colors.indigo,
    //         disabledColor: Colors.brown,
    //         // color: const MaterialStatePropertyAll(Colors.white),
    //         label: Text(
    //           s,
    //           style: TextStyle(
    //             color: s == currentBatch ? Colors.white : Colors.black,
    //           ),
    //         ),
    //         onSelected: (bool isSelected) {
    //           // if (isSelected) {
    //           // _activityTypes.add(s);
    //           currentBatch = s;
    //           // } else {
    //           print('btn pressed -> $currentBatch $s');
    //           //   _activityTypes.remove(s);
    //           // }
    //           setState(() {});
    //         },
    //         selected: s == currentBatch,
    //       ),
    //   ],
    // );
  }
}
