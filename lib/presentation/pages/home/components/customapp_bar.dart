import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/presentation/pages/home/components/appbar_top_user_detail.dart';
import 'package:deshifarmer/presentation/pages/home/components/home_balance_card.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({
    super.key,
    required this.usrProfile,
  });

  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: tertiaryColor,
      expandedHeight: getProportionateScreenHeight(250),
      shape: const RoundedRectangleBorder(
        /// only for bottom
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      // flexibleSpace: Text('HOLA'),
      floating: true,
      centerTitle: true,
      flexibleSpace: AppBarTopUserDetail(usrProfile: usrProfile),
      bottom: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width / 1,
          getProportionateScreenHeight(65),
        ),
        child: HomeBalanceCard(usrProfile: usrProfile),
      ),
    );
  }
}
