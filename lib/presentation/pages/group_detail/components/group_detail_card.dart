import 'package:deshifarmer/domain/entities/group_detail_entity/group_detail_entity.dart';
import 'package:flutter/material.dart';

class GroupDetailCard extends StatelessWidget {
  const GroupDetailCard({
    required this.gdE,
    super.key,
  });

  final GroupDetailEntity gdE;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // column -> manager id, leader name & leader phone
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'গ্রুপ ম্যানেজার আইডি',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  gdE.group_manager_id ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'গ্রুপ লিডার নাম',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  gdE.group_leader?.full_name ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'গ্রুপ লিডার ফোন নাম্বার',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  gdE.group_leader?.phone ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
