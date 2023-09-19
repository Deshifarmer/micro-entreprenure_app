import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:deshifarmer/presentation/pages/home/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/order/order.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

/// home page bottom navigation bar
class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    return AnimatedBottomNavigationBar(
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
      icons: const <IconData>[
        Icons.view_carousel_outlined,
        Icons.cake_outlined,
        Icons.reorder,
        Icons.account_circle_outlined,
      ],
      onTap: (int x) {
        final loginState = context.read<LoginBloc>().state;
        if (x == 1) {
          if (loginState is LoginSuccess) {
            context
                .read<OrderBloc>()
                .add(InitOrders(loginState.successLoginEntity.token));
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
      activeColor: Colors.white,
      inactiveColor: Colors.grey,
    );
  }
}
