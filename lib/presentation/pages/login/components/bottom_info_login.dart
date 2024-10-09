import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

class BottomInfo extends StatelessWidget {
  const BottomInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'v1.11',
          style: TextStyle(
            color: iconBackgroundColor,
          ),
        ),
        Text(
          'প্লাটফর্ম পলিসি',
          style: TextStyle(
            color: iconBackgroundColor,
          ),
        ),
      ],
    );
  }
}
