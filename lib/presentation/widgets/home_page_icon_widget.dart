import 'package:flutter/material.dart';

class HomePageIconWidget extends StatelessWidget {
  const HomePageIconWidget({
    required this.title,
    super.key,
    this.painter,
    this.icon,
  });
  final String title;
  final CustomPainter? painter;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          icon!
        else
          CustomPaint(
            painter: painter,
            size: const Size(25, 25),
          ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 10,
                // fontWeight: FontWeight.w400,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
