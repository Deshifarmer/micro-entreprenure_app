import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/presentation/pages/home/components/card_of_dashboard.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:flutter/material.dart';

class MyKPI extends StatelessWidget {
  const MyKPI({
    required this.usrProfile,
    super.key,
  });
  final UserProfileEntity usrProfile;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 30,
                ),
                child: Text(
                  'টার্গেট',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color(0xff4C6E5E),
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              CardOfDashboard(
                current: usrProfile.total_farmer,
                target: 1000,
                title: 'On Board Farmers',
                painder: const MyFarmersShape(
                  colorF: Color(0xff7D4600),
                ),
                isSymbol: false,
              ),
              CardOfDashboard(
                current: usrProfile.total_sale,
                target: 10000,
                title: 'Monthly Sale',
                isSymbol: true,
                painder: const MyFarmersShape(
                  colorF: Color(0xff7D4600),
                ),
              ),
            ],
          );
        },
        childCount: 1,
      ),
    );
  }
}
