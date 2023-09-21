import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FarmerWeatherCard extends StatelessWidget {
  const FarmerWeatherCard({required this.usrProfile, super.key});
  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Card(
        elevation: 0,
        // color: Colors.white,
        // shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        // margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      CupertinoIcons.location,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        usrProfile.home_district.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '33 kmph',
                        style: Theme.of(context).textTheme.labelSmall,
                        // style:
                        //     Theme.of(context).textTheme.,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '35°',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: const Color(0xff0BA00B),
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'May Rain Today',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
