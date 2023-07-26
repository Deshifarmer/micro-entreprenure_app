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
        Text('v1.4'),
        Text('Platform Policy'),
      ],
    );
  }
}
