import 'package:deshifarmer/presentation/pages/home/components/card_of_dashboard.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ViewMyKPIPage extends StatelessWidget {
  const ViewMyKPIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        surfaceTintColor: backgroundColor2,
        backgroundColor: backgroundColor2,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                bottom: 15,
              ),
              child: Text(
                'আমার কে পি আই',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// two container with column 3 text children
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      // margin: const EdgeInsets.all(5),
                      height: getProportionateScreenHeight(150),
                      decoration: BoxDecoration(
                        color: priceBoxColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Text(
                            'পণ্য বিক্রয়',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2,
                            ),
                            child: Text(
                              'মোট',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      // margin: const EdgeInsets.all(5),
                      height: getProportionateScreenHeight(150),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '0%',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Text(
                            'সাফল্যের পরিমান',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2,
                            ),
                            child: Text(
                              'মোট',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// kpi from homepage
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),

            CardOfDashboard(
              current: 0,
              target: 1000,
              title: 'নতুন কৃষকের সংখ্যা',
              painder: MyFarmersShape(),
              isSymbol: false,
            ),
            CardOfDashboard(
              current: 0,
              target: 1000,
              title: 'মাসিক বিক্রয় টার্গেট',
              painder: MyFarmersShape(),
              isSymbol: false,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'মাসিক তথ্য',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),

            /// 3 bar of sales, orders and task
            // Text('holdldlajksdf asdfsa'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  height: getProportionateScreenHeight(220),
                  width: getProportionateScreenWidth(50),
                  child: Column(
                    children: [
                      Expanded(
                        child: FAProgressBar(
                          size: 40,
                          maxValue: 150,
                          changeColorValue: 100,
                          changeProgressColor: Colors.pink,
                          backgroundColor: Colors.white,
                          progressColor: Colors.lightBlue,
                          direction: Axis.vertical,
                          verticalDirection: VerticalDirection.up,
                          // displayText: 'mph',
                          formatValueFixed: 2,
                          progressGradient: const LinearGradient(
                            colors: [
                              Color(0xff8DD22E),
                              Color(0xff3E6705),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text('বিক্রয়'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  height: getProportionateScreenHeight(220),
                  width: getProportionateScreenWidth(50),
                  child: Column(
                    children: [
                      Expanded(
                        child: FAProgressBar(
                          size: 40,
                          maxValue: 150,
                          changeColorValue: 100,
                          changeProgressColor: Colors.pink,
                          backgroundColor: Colors.white,
                          progressColor: Colors.lightBlue,
                          direction: Axis.vertical,
                          verticalDirection: VerticalDirection.up,
                          formatValueFixed: 2,
                          progressGradient: const LinearGradient(
                            colors: [
                              Color(0xff01543B),
                              Color(0xff051611),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text('অর্ডার'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  height: getProportionateScreenHeight(220),
                  width: getProportionateScreenWidth(50),
                  child: Column(
                    children: [
                      Expanded(
                        child: FAProgressBar(
                          size: 40,
                          maxValue: 150,
                          changeColorValue: 100,
                          changeProgressColor: Colors.pink,
                          backgroundColor: Colors.white,
                          progressColor: Colors.lightBlue,
                          direction: Axis.vertical,
                          verticalDirection: VerticalDirection.up,
                          progressGradient: const LinearGradient(
                            colors: [
                              Color(0xffEB5757),
                              Color(0xff611616),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          formatValueFixed: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text('টাস্ক'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SecondayButtonGreen(
        onpress: () {},
        title: 'Add a new Request',
      ),
    );
  }
}
