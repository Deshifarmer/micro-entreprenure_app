import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoConnectionStateWidget extends StatelessWidget {
  const NoConnectionStateWidget({super.key, required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/animations/no_internet.json',
            ),
            const Text('ইন্টারনেট সংযোগ নেই'),
            const SizedBox(
              height: 20,
            ),
            SecondayButtonGreen(
              onpress: onRetry,
              title: 'পুনরায় চেষ্টা করুন',
            ),
          ],
        ),
      ),
    );
  }
}
