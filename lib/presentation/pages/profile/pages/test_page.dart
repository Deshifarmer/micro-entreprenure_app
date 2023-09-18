import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TestPage extends StatelessWidget {
  const TestPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: LottieBuilder.asset(
          'assets/animations/failed.json',
        ),
      ),
    );
  }
}
