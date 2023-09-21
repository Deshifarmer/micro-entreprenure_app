import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/home/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/order/order.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

/// home page bottom navigation bar
class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
  });
  final icons = const <IconData>[
    Icons.view_carousel_outlined,
    Icons.cake_outlined,
    Icons.reorder,
    Icons.account_circle_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    return AnimatedBottomNavigationBar.builder(
      height: getProportionateScreenHeight(70),
      activeIndex: state is HomeInitial
          ? 0
          : state is MyOrderPageState
              ? 1
              : state is CommisionPageState
                  ? 2
                  : 3,
      //  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      // leftCornerRadius: HomePageParams.bottomNavCornerRaidus,
      // rightCornerRadius: HomePageParams.bottomNavCornerRaidus,
      // leftCornerRadius: 10,
      // rightCornerRadius: 10,
      blurEffect: true,
      hideAnimationCurve: Curves.easeOut,
      elevation: 0,
      // icons: const <IconData>[
      //   Icons.view_carousel_outlined,
      //   Icons.cake_outlined,
      //   Icons.reorder,
      //   Icons.account_circle_outlined,
      // ],
      itemCount: 4,
      tabBuilder: (index, isActive) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (index == 1)
              CustomPaint(
                painter: MyFarmersShape(
                  colorF: isActive ? Colors.white : Colors.grey,
                ),
                size: const Size(20, 20),
              )
            else
              Icon(
                icons[index],
                // size: 24,
                color: isActive ? Colors.white : Colors.grey,
              ),
            const SizedBox(height: 4),
            Text(
              index == 0
                  ? 'হোম'
                  : index == 1
                      ? 'কৃষক তালিকা'
                      : index == 2
                          ? 'অর্ডার তালিকা'
                          : 'প্রোফাইল',
              // style: TextStyle(
              //   color: isActive ? Colors.white : Colors.grey,
              //   // fontSize: 12,
              //   fontWeight: FontWeight.w600,
              // ),
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: isActive ? Colors.white : Colors.grey,
                    // fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        );
      },
      onTap: (int x) {
        final loginState = context.read<LoginBloc>().state;
        if (x == 2 || x == 0) {
          if (loginState is LoginSuccess) {
            context
                .read<OrderBloc>()
                .add(InitOrders(loginState.successLoginEntity.token));
          }
        }
        if (x == 1) {
          if (loginState is LoginSuccess) {
            context
                .read<MyFarmerBloc>()
                .add(MyFarmerFetchEvent(loginState.successLoginEntity.token));
          }
        }

        // if (x == 2) {
        //   context
        //       .read<HistoryBloc>()
        //       .add(const ChangeSegmentBtnE(HistorySegmentButtonEnum.shorturl));
        // }
        context.read<HomeBloc>().add(ChangePageEvent(x));
      },
      backgroundColor: tertiaryColor,
      // activeColor: Colors.white,
      // inactiveColor: Colors.grey,
    );
  }
}
