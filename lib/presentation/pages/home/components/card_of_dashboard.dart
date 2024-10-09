import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class CardOfDashboard extends StatelessWidget {
  const CardOfDashboard({
    required this.current,
    required this.painder,
    required this.target,
    required this.title,
    required this.isSymbol,
    super.key,
  });
  final String title;
  final CustomPainter painder;
  final int target;
  final int current;
  final bool isSymbol;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        // vertical: 5,
      ),
      child: Stack(
        children: [
          Card(
            elevation: 0,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  // icon
                  const CustomPaint(
                    painter: MyFarmersShape(
                      colorF: Color(0xff000000),
                    ),
                    size: Size(25, 25),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  // column -> on board, a progress, int/total
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: LinearProgressIndicator(
                            backgroundColor: const Color(0xffF0F0F0),
                            minHeight: getProportionateScreenHeight(10),
                            value: current / target,
                            color: tertiaryColor,
                          ),
                        ),
                      ),
                      Text(
                        '${isSymbol ? "৳" : ""} $current/$target',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 10,
            child: Text(
              '${isSymbol ? "৳" : ""} $current',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
