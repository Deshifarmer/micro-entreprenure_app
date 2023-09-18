import 'package:deshifarmer/presentation/pages/agri_advisory/agri_advisory.dart';
import 'package:flutter/material.dart';

class AdvisorySubjects extends StatefulWidget {
  const AdvisorySubjects({
    super.key,
  });

  @override
  State<AdvisorySubjects> createState() => _AdvisorySubjectsState();
}

class _AdvisorySubjectsState extends State<AdvisorySubjects> {
  // List<String> _activityTypes = [];
  String singleSelect = '';
  @override
  Widget build(BuildContext context) {
    final agriAdvisory = context.read<AgriAdvisoryBloc>().state;
    if (agriAdvisory is AgriAdvisoryInitial) {
      agriAdvisory.subjects.text = singleSelect;
    }
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            for (final s in advisorySubjects)
              FilterChip(
                backgroundColor: const Color(0xffd9d9d9),
                label: Text(s),
                side: BorderSide.none,
                onSelected: (bool isSelected) {
                  // if (isSelected) {
                  // _activityTypes.add(s);
                  singleSelect = s;
                  // } else {
                  //   singleSelect = s;
                  // }
                  setState(() {});
                },
                selected: s == singleSelect,
              ),
          ],
        ),
        // list of filter chip
      ],
    );
  }
}

List<String> advisorySubjects = [
  'Crop swing',
  'Forward market linkage',
  'Pest control',
  'Climatae resilient farming',
  'What is the subject',
  'Lianage',
  // 'Theres no subject Sir',
  // 'Im the subject',
  // 'What is Subject?',
  // 'Where am i?',
  // 'who are you?',
  // 'Holy shot!!',
];
