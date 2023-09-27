import 'package:deshifarmer/data/datasources/remote/apis/get_weather_api.dart';
import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/domain/entities/weather/weather_entity.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FarmerWeatherCard extends StatelessWidget {
  const FarmerWeatherCard({required this.usrProfile, super.key});
  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: FutureBuilder<WeatherEntity?>(
        future: getCurrentWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Card(
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
                              '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              '',
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
                          '',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: const Color(0xff0BA00B),
                              ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${snapshot.data?.weather.first.description}',
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
                .animate(
              onPlay: (controller) => controller.repeat(reverse: true),
              // onComplete: (controller) => controller.repeat(reverse: true),
            )
                .shimmer(
              colors: [
                Colors.white,
                Colors.grey[300]!,
                Colors.white,
              ],
              duration: Duration(seconds: 2),
              curve: Curves.ease,
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          final weather = snapshot.data;
          if (weather == null) {
            return const Center(
              child: Text('No Data'),
            );
          }

          return Card(
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
                            '${snapshot.data?.name}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '${snapshot.data?.wind.speed} kmph',
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
                        '${snapshot.data?.main.temp}°',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: const Color(0xff0BA00B),
                                ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '${snapshot.data?.weather.first.description}',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
