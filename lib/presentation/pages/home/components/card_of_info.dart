import 'package:flutter/material.dart';

class CardOfSmallInfo extends StatelessWidget {
  const CardOfSmallInfo({
    required this.ammount,
    required this.icon,
    required this.title,
    super.key,
  });

  final String title;
  final String ammount;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        color: const Color(0xff4C6E5E),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        letterSpacing: .9,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  ammount,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
