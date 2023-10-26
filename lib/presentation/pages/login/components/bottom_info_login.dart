import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

class BottomInfo extends StatelessWidget {
  const BottomInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'v1.11',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: iconBackgroundColor,
              ),
        ),
        Text(
          'প্লাটফর্ম পলিসি',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: iconBackgroundColor,
              ),
        ),
      ],
    );
  }
}
