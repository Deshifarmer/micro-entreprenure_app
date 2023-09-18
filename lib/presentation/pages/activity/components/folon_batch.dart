import 'package:deshifarmer/presentation/utils/activity_types_paramas.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

class FolonBatchData extends StatefulWidget {
  const FolonBatchData({super.key});

  @override
  State<FolonBatchData> createState() => _FolonBatchDataState();
}

class _FolonBatchDataState extends State<FolonBatchData> {
  String currentBatch = '';
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      children: [
        for (final s in activityRecordValues.keys)
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
              s,
              style: TextStyle(
                color: s == currentBatch ? Colors.white : Colors.black,
              ),
            ),
            onSelected: (bool isSelected) {
              // if (isSelected) {
              // _activityTypes.add(s);
              currentBatch = s;
              // } else {
              print('btn pressed -> $currentBatch $s');
              //   _activityTypes.remove(s);
              // }
              setState(() {});
            },
            selected: s == currentBatch,
          ),
      ],
    );
  }
}
