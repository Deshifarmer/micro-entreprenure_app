import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
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
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
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
                  CustomPaint(
                    painter: MyFarmersShape(),
                    size: const Size(25, 25),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // column -> on board, a progress, int/total
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(title),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: LinearProgressIndicator(
                            backgroundColor: const Color(0xffF0F0F0),
                            minHeight: 10,
                            value: current / target,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      Text('${isSymbol ? r"$" : ""} $current/$target'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 30,
            top: 10,
            child: Text('${isSymbol ? r"$" : ""} $current'),
          ),
        ],
      ),
    );
  }
}
