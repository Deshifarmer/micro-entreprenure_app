import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

class FarmerCard extends StatelessWidget {
  const FarmerCard({
    required this.currentFarmer,
    super.key,
  });

  final FarmerEntity? currentFarmer;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor2,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// farmer name
                Text(
                  currentFarmer?.full_name ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                /// famer address
                Text(
                  'vill - ${currentFarmer?.village}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),

          /// famer phone
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 5,
              ),
              child: Column(
                children: [
                  Text(
                    currentFarmer?.phone ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),

                  /// usaid ID
                  if (currentFarmer?.usaid_id != null)
                    Text(
                      'usaid : ${currentFarmer?.usaid_id}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
          ),

          /// menu icon button
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.black.withOpacity(0.54),
            ),
          ),
        ],
      ),
    );
  }
}
