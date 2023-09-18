import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class HomePageIconWidget extends StatelessWidget {
  const HomePageIconWidget({
    required this.painter,
    required this.title,
    this.icon,
    super.key,
  });
  final String title;
  final CustomPainter painter;
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
                fontSize: smallFont,
                fontWeight: FontWeight.w400,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
