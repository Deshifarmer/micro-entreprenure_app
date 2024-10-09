import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/view/farmer_listo_page.dart';
import 'package:deshifarmer/presentation/pages/home/components/card_of_info.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/view/order_page.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalFarmerTotalOrders extends StatelessWidget {
  const TotalFarmerTotalOrders({
    // required this.usrProfile,
    super.key,
  });

  // final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    return BlocConsumer<UserProfileBloc, UserProfileState>(
      listener: (context, state) {},
      listenWhen: (previous, current) {
        debugPrint('LISTENWHEN: previous $previous current $current');
        if (current is UserProfileFetchSuccess &&
            previous is UserProfileFetchSuccess) {
          debugPrint(
              'BUILDWHEN: ${previous.userProfile.total_farmer} ${current.userProfile.total_farmer}',);
          return previous.userProfile.total_farmer !=
                  current.userProfile.total_farmer ||
              previous.userProfile.total_sale != current.userProfile.total_sale;
        }
        return false;
      },
      buildWhen: (previous, current) {
        debugPrint('BUILDWHEN: previous $previous current $current');
        if (current is UserProfileFetchSuccess &&
            previous is UserProfileFetchSuccess) {
          debugPrint(
              'BUILDWHEN: ${previous.userProfile.total_farmer} ${current.userProfile.total_farmer}',);
          return previous.userProfile.total_farmer !=
                  current.userProfile.total_farmer ||
              previous.userProfile.total_sale != current.userProfile.total_sale;
        }
        return false;
      },
      builder: (context, state) {
        if (state is UserProfileInitial) {
          return const Center(
            child: PrimaryLoadingIndicator(),
          );
        }
        if (state is UserProfileFetchSuccess) {
          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      if (loginState is LoginSuccess) {
                        context.read<MyFarmerBloc>().add(MyFarmerFetchEvent(
                            loginState.successLoginEntity.token,),);
                      }
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => const Material(
                            child: FarmerListoPage(
                              isBack: true,
                            ),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: getProportionateScreenWidth(20),
                        top: getProportionateScreenHeight(10),
                        bottom: getProportionateScreenHeight(10),
                      ),
                      child: CardOfSmallInfo(
                        ammount: state.userProfile.total_farmer.toString(),
                        isIcon: false,
                        title: 'মোট কৃষক',
                      ),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      // print('butotn clickeddddddddddddd');
                      context.read<OrderBloc>().add(
                            InitOrders(
                              token,
                            ),
                          );
                      Navigator.push(
                        context,
                        OrderPage.route(),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: getProportionateScreenWidth(20),
                        top: getProportionateScreenHeight(10),
                        bottom: getProportionateScreenHeight(10),
                      ),
                      child: CardOfSmallInfo(
                        ammount: state.userProfile.total_sale.toString(),
                        isIcon: true,
                        title: 'মোট অর্ডার',
                      ),
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
        return const Center(
          child: PrimaryLoadingIndicator(),
        );
      },
      // child: state is UserProfileInitial
      //     ? Center(
      //         child: PrimaryLoadingIndicator(),
      //       )
      //     : ,
    );
  }
}
