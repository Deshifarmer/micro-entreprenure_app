import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/presentation/pages/commision/commision.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class HomeBalanceCard extends StatelessWidget {
  const HomeBalanceCard({
    required this.usrProfile,
    super.key,
  });

  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      height: getProportionateScreenHeight(65),
      decoration: BoxDecoration(
        color: priceBoxColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'ব্যালেন্স',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
              ),
              // SizedBox(
              //   width: getProportionateScreenWidth(15),
              // ),
              Text(
                '৳ ${usrProfile.account_details.first.net_balance}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          // row
          // a big logo
          // column -> balance, money
          // transaction
          InkWell(
            onTap: () {
              /// goto comissionpage
              Navigator.push(context, CommisionPage.route());
            },
            child: Container(
              width: getProportionateScreenWidth(120),
              // alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'সকল লেনদেন',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: const Color(0xff8C580B), fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  const Icon(
                    Icons.arrow_right_alt_outlined,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
