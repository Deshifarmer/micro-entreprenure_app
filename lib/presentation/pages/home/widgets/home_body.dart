import 'package:deshifarmer/core/params/home_page_params.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/farmer_listo.dart';
import 'package:deshifarmer/presentation/pages/home/components/appbar_top_user_detail.dart';
import 'package:deshifarmer/presentation/pages/home/components/card_of_dashboard.dart';
import 'package:deshifarmer/presentation/pages/home/components/card_of_info.dart';
import 'package:deshifarmer/presentation/pages/home/components/farmer_weather_card.dart';
import 'package:deshifarmer/presentation/pages/home/components/home_balance_card.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/products/products.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/widgets/home_page_icon_widget.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:flutter/material.dart';

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
              SliverAppBar(
                backgroundColor: const Color(0xff4C6E5E),
                expandedHeight: 250,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                // flexibleSpace: Text('HOLA'),
                floating: true,
                centerTitle: true,
                flexibleSpace: AppBarTopUserDetail(usrProfile: usrProfile),
                bottom: PreferredSize(
                  preferredSize: Size(
                    MediaQuery.of(context).size.width / 1.2,
                    65,
                  ),
                  child: HomeBalanceCard(usrProfile: usrProfile),
                ),
              ),

              ///! total farmers/orders card
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return index == 0
                        ? CardOfSmallInfo(
                            ammount: usrProfile.total_farmer.toString(),
                            icon: Icons.man,
                            title: 'Farmers',
                          )
                        : CardOfSmallInfo(
                            ammount: usrProfile.total_sale.toString(),
                            icon: Icons.list,
                            title: 'Orders',
                          );
                  },
                  childCount: 2,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 120,
                ),
              ),

              ///! Weather Card
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 25,
                      ),
                      child: FarmerWeatherCard(
                        usrProfile: usrProfile,
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),

              ///! Grid Icons List
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final currentIcon =
                        HomePageParams.homePageIconDatas.elementAt(index);
                    return HomePageIconWidget(
                      title: currentIcon.title,
                      painter: currentIcon.painter,
                    );
                  },
                  childCount: 8,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 120,
                ),
              ),

              ///! A Simple Banner 1
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      height: 80,
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xffD9D9D9),
                      ),
                      child: const Center(child: Text('Banner 1')),
                    );
                  },
                  childCount: 1,
                ),
              ),

              ///! My KPIs -> (on board farmers | Monthly sales)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 30,
                          ),
                          child: Text(
                            'My KPIs',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: const Color(0xff4C6E5E),
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        CardOfDashboard(
                          current: 189,
                          target: 1000,
                          title: 'On Board Farmers',
                          painder: MyFarmersShape(),
                          isSymbol: false,
                        ),
                        CardOfDashboard(
                          current: 6150,
                          target: 10000,
                          title: 'Monthly Sale',
                          isSymbol: true,
                          painder: MyFarmersShape(),
                        ),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),

              ///! My orders -> list of farmers

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 30,
                            right: 30,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'My Orders',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: const Color(0xff4C6E5E),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                'see all',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: const Color(0xff4C6E5E),
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        //TODO: uncomment this
                        // const MyOrderCard(),
                        // const MyOrderCard(),
                        // const MyOrderCard(),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),

              ///! shortcuts
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Text(
                        'Shortcuts',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: const Color(0xff4C6E5E),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),

              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final currentShortCut =
                        HomePageParams.homePageShortCuts.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: HomePageIconWidget(
                        painter: currentShortCut.painter,
                        title: currentShortCut.title,
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

              ///! A Simple Banner 2
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      height: 80,
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xffD9D9D9),
                      ),
                      child: const Center(child: Text('Banner 1')),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          );
        }
        if (state is UserProfileFetchFailed) {
          return const Center(
            child: Text('Data Fetching failed'),
          );
        }
        return const Center(
          child: PrimaryLoadingIndicator(),
        );
      },
    );
  }
}
