import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:flutter/material.dart';

class FarmerCard extends StatelessWidget {
  const FarmerCard({
    super.key,
    required this.currentFarmer,
  });

  final FarmerEntity? currentFarmer;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            '${Strings.domain}/storage/${currentFarmer?.image}',
            height: 50,
            width: 50,
          ),
        ),
        title: Text(currentFarmer?.full_name ?? ''),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentFarmer?.phone ?? ''),
            Text(currentFarmer?.district ?? ''),
          ],
        ),
      ),
    );
  }
}
