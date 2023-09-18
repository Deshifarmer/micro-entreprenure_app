import 'package:deshifarmer/presentation/pages/agri_advisory/agri_advisory.dart';
import 'package:flutter/material.dart';

class AdvisoryTimeslot extends StatefulWidget {
  const AdvisoryTimeslot({
    super.key,
  });

  @override
  State<AdvisoryTimeslot> createState() => _AdvisoryTimeslotState();
}

class _AdvisoryTimeslotState extends State<AdvisoryTimeslot> {
  int timeslot = 15;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilterChip(
          padding: const EdgeInsets.all(8),
          backgroundColor: const Color(0xffd9d9d9),
          label: Text('${index * 5 + 15} min',
              style: TextStyle(
                color: timeslot == index * 5 + 15 ? Colors.white : null,
              )),
          side: BorderSide.none,
          onSelected: (bool isSelected) {
            final agriAdvisory = context.read<AgriAdvisoryBloc>().state;
            if (isSelected) {
              // _activityTypes.add(s);
              timeslot = index * 5 + 15;
              if (agriAdvisory is AgriAdvisoryInitial) {
                agriAdvisory.timeslots.text = timeslot.toString();
              }
            }
            setState(() {});
          },
          selected: timeslot == index * 5 + 15,
        ),
      ),
    );
  }
}
