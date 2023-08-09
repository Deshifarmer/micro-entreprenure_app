import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FarmerWeatherCard extends StatelessWidget {
  const FarmerWeatherCard({super.key, required this.usrProfile});
  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 5,
        // color: Colors.white,
        // shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        // margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      CupertinoIcons.location,
                      size: 35,
                      color: Colors.blue,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        usrProfile.home_district.toString(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        usrProfile.present_address ?? '',
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
                          color: Color(0xff0BA00B),
                        ),
                  ),
                  SizedBox(
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
