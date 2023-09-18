import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FailedWidget extends StatelessWidget {
  const FailedWidget({super.key, this.txt});
  final String? txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          'assets/animations/failed.json',
        ),
        if (txt != null)
          Text(
            txt!,
          ),
      ],
    );
  }
}
