import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class SimpleBanner extends StatelessWidget {
  const SimpleBanner({
    required this.asset,
    super.key,
  });
  final String asset;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                asset,
              ),
            ),
          );
        },
        childCount: 1,
      ),
    );
  }
}
