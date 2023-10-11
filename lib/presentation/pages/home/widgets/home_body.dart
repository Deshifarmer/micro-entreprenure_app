import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deshifarmer/core/params/home_page_params.dart';
import 'package:deshifarmer/data/datasources/remote/apis/attendance_api.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/view/add_farmer_page.dart';
import 'package:deshifarmer/presentation/pages/attendance/attendance.dart';
import 'package:deshifarmer/presentation/pages/commision/commision.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/view/farmadd_form_page.dart';
import 'package:deshifarmer/presentation/pages/home/components/customapp_bar.dart';
import 'package:deshifarmer/presentation/pages/home/components/farmer_weather_card.dart';
import 'package:deshifarmer/presentation/pages/home/components/home_page_orders.dart';
import 'package:deshifarmer/presentation/pages/home/components/my_kpi.dart';
import 'package:deshifarmer/presentation/pages/home/components/quick_actions.dart';
import 'package:deshifarmer/presentation/pages/home/components/simple_banner.dart';
import 'package:deshifarmer/presentation/pages/home/components/total_farmer_r_order.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/widgets/a_dialog_forimage.dart';
import 'package:deshifarmer/presentation/widgets/home_page_icon_widget.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restart_app/restart_app.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileFetchSuccess) {
          final usrProfile = state.userProfile;
          // return HomeBodyListView(usrProfile: usrProfile);
          return CustomScrollView(
            slivers: [
              ///! App Bar
              MyCustomAppBar(usrProfile: usrProfile),

              ///! total farmers/orders card
              TotalFarmerTotalOrders(usrProfile: usrProfile),

              ///! Weather Card
              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     (_, int index) {
              //       return FarmerWeatherCard(
              //         usrProfile: usrProfile,
              //       );
              //     },
              //     childCount: 1,
              //   ),
              // ),

              ///! Quick Actions
              const QuickActions(),

              ///! A Simple Banner 1
              const SimpleBanner(
                asset: 'assets/banner/1.png',
              ),

              ///! My KPIs -> (on board farmers | Monthly sales)
              MyKPI(usrProfile: usrProfile),

              ///! My orders -> list of farmers

              const HomePageOrders(),

              ///! shortcuts
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
                        vertical: getProportionateScreenHeight(10),
                      ),
                      child: Text(
                        'শর্টকাট',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: const Color(0xff4C6E5E),
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                ),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final currentShortCut =
                          HomePageParams.homePageShortCuts.elementAt(index);
                      return InkWell(
                        onTap: () async {
                          final loginState = context.read<LoginBloc>().state;
                          final token = loginState is LoginSuccess
                              ? loginState.successLoginEntity.token
                              : '';
                          switch (currentShortCut.title) {
                            case 'উপস্থিতি':
                              // if todays attendance is not checked in
                              // CheckInFromFuture
                              final today = await AttendanceAPI()
                                  .getTodaysAttendance(token);
                              if (today != null) {
                                // debugPrint('today is not null');
                                context
                                    .read<AttendanceBloc>()
                                    .add(CheckInFromFuture(today));
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => const AttendancePage(),
                                  ),
                                );
                              } else {
                                // debugPrint('today is nULLLL');
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      const ImportDialog(
                                    attStatus: AttendanceStatus.checkIn,
                                    id: '',
                                  ),
                                );
                              }

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => const AttendancePage(),
                            //   ),
                            // );
                            case 'নতুন কৃষক যোগ':
                              await Navigator.push(
                                context,
                                AddFarmerPage.route(),
                              );

                            case 'কমিশন':
                              await Navigator.push(
                                context,
                                CommisionPage.route(),
                              );
                            case 'নতুন ফার্ম যোগ':
                              // MyFarmerBloc
                              context.read<MyFarmerBloc>().add(
                                    MyFarmerFetchEvent(
                                      token,
                                    ),
                                  );
                              await Navigator.push(
                                context,
                                FarmaddFormPage.route(),
                              );
                            default:
                          }
                        },
                        child: HomePageIconWidget(
                          title: currentShortCut.title,
                          painter: currentShortCut.painter,
                          icon: currentShortCut.icon,
                        ),
                      );
                    },
                    childCount: 4,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 120,
                  ),
                ),
              ),

              ///! A Simple Banner 2
              const SimpleBanner(
                asset: 'assets/banner/2.png',
              ),

              ///! some space on the bottom
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return SizedBox(
                      height: getProportionateScreenHeight(95),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          );
        }
        if (state is UserProfileFetchFailed) {
          return RefreshIndicator(
            onRefresh: () async {
              debugPrint('refreshing');
              final loginState = context.read<LoginBloc>().state;
              final token = loginState is LoginSuccess
                  ? loginState.successLoginEntity.token
                  : '';
              context
                  .read<UserProfileBloc>()
                  .add(GetUserProfileEvent(token: token));
            },
            child: GestureDetector(
              onTap: () {
                final loginState = context.read<LoginBloc>().state;
                final token = loginState is LoginSuccess
                    ? loginState.successLoginEntity.token
                    : '';
                context
                    .read<UserProfileBloc>()
                    .add(GetUserProfileEvent(token: token));
              },
              child: FutureBuilder<ConnectivityResult>(
                future: Connectivity().checkConnectivity(),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.data == ConnectivityResult.none) {
                    return Center(
                      child: Column(
                        children: [
                          LottieBuilder.asset(
                              'assets/animations/no_internet.json'),
                          const Text('ইন্টারনেট সংযোগ নেই'),

                          /// a button to restart the app
                          SecondayButtonGreen(
                            onpress: () async {
                              await Restart.restartApp();
                            },
                            title: 'পুনরায় চেষ্টা করুন',
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: Column(
                      children: [
                        LottieBuilder.asset('assets/animations/failed.json'),
                        const Text('কিছু ভুল হয়েছে'),

                        /// a button to restart the app
                        SecondayButtonGreen(
                          onpress: () async {
                            await Restart.restartApp();
                          },
                          title: 'পুনরায় চেষ্টা করুন',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const Center(
          child: PrimaryLoadingIndicator(),
        );
      },
    );
  }
}
