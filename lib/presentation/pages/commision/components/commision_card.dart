import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class CommisionCard extends StatelessWidget {
  const CommisionCard({
    required this.subtitle,
    required this.title,
    required this.isFilled,
    super.key,
  });
  final bool isFilled;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isFilled ? priceBoxColor : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      height: getProportionateScreenHeight(200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenHeight(5),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: isFilled ? Colors.white : null,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenHeight(5),
            ),
            child: Text(
              subtitle,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: isFilled ? Colors.white : null,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
