import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class CardOfSmallInfo extends StatelessWidget {
  const CardOfSmallInfo({
    required this.ammount,
    required this.isIcon,
    required this.title,
    super.key,
  });

  final String title;
  final String ammount;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        color: tertiaryColor,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.c,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              // child: Icon(
              //   icon,
              //   // size: 25,
              //   color: Colors.white,
              // ),
              child: isIcon
                  ? Icon(
                      Icons.format_list_numbered,
                      color: Colors.white,
                    )
                  : CustomPaint(
                      painter: const MyFarmersShape(
                        colorF: Colors.white,
                      ),
                      size: Size(
                        getProportionateScreenWidth(30),
                        getProportionateScreenHeight(30),
                      ),
                      // size: 25,
                      // color: Colors.white,
                    ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                        letterSpacing: .9,
                        // fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  ammount,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
