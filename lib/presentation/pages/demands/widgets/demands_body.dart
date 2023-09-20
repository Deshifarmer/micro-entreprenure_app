import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

/// {@template demands_body}
/// Body of the DemandsPage.
///
/// Add what it does
/// {@endtemplate}
class DemandsBody extends StatelessWidget {
  /// {@macro demands_body}
  const DemandsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          const Text(
            'বাজার চাহিদা',
            style: TextStyle(
              fontSize: 18,
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              '''
We need vegetable and other agriculture produces to meet the market demand. We are collecting these fresh produces directly from the farmers.
          ''',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Text(
            '''
You can see the general market demand for deshi-farmer here and do your shipment to meet the market demands.
''',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('from deshifarmer for purchase'),
              Text('latest'),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),

          ///TODO: Items
          /* Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Potato',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'sticky',
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              Text(
                'Dhaka',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ), */
        ],
      ),
    );
  }
}

enum ShritType {
  xl,
  l,
  xxxl,
  m,
  s,
  sm,
}
