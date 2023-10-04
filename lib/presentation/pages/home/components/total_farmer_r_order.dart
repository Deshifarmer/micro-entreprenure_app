import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/view/farmer_listo_page.dart';
import 'package:deshifarmer/presentation/pages/home/components/card_of_info.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/view/order_page.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TotalFarmerTotalOrders extends StatelessWidget {
  const TotalFarmerTotalOrders({
    required this.usrProfile,
    super.key,
  });

  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () {
                if (loginState is LoginSuccess) {
                  context.read<MyFarmerBloc>().add(
                      MyFarmerFetchEvent(loginState.successLoginEntity.token));
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
                  ammount: usrProfile.total_farmer.toString(),
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
                  ammount: usrProfile.total_sale.toString(),
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
}
