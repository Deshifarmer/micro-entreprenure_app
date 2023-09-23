import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/presentation/pages/home/components/card_of_info.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class TotalFarmerTotalOrders extends StatelessWidget {
  const TotalFarmerTotalOrders({
    required this.usrProfile,
    super.key,
  });

  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                top: getProportionateScreenHeight(10),
                bottom: getProportionateScreenHeight(10),
              ),
              child: CardOfSmallInfo(
                ammount: usrProfile.total_farmer.toString(),
                isIcon: false,
                title: 'মোট কৃষক',
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(
                right: getProportionateScreenWidth(20),
                top: getProportionateScreenHeight(10),
                bottom: getProportionateScreenHeight(10),
              ),
              child: CardOfSmallInfo(
                ammount: usrProfile.total_sale.toString(),
                isIcon: true,
                title: 'মোট অর্ডার',
              ),
            );
          }
        },
        childCount: 2,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 120,
      ),
    );
  }
}
