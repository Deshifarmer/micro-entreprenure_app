import 'package:flutter/material.dart';

class SimpleCardTexts extends StatelessWidget {
  const SimpleCardTexts({
    required this.title,
    required this.subtitle,
    required this.isActive,
    super.key,
  });
  final String title;
  final String subtitle;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          // style: TextStyle(
          //   color: isActive ? Colors.white : null,
          //   fontSize: isActive ? 14 : 12,
          //   fontWeight: isActive ? FontWeight.bold : null,
          // ),
          style: isActive
              ? Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: isActive ? Colors.white : null,
                    fontWeight: isActive ? FontWeight.bold : null,
                  )
              : Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: isActive ? Colors.white : null,
                    fontWeight: isActive ? FontWeight.bold : null,
                  ),
          overflow: TextOverflow.fade,
        ),
        SingleChildScrollView(
          child: Text(
            subtitle,
            style: isActive
                ? Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: isActive ? Colors.white : null,
                      fontWeight: !isActive ? FontWeight.bold : null,
                    )
                : Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: isActive ? Colors.white : null,
                      fontWeight: !isActive ? FontWeight.bold : null,
                    ),
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
