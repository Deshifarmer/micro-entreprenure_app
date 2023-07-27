import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:deshifarmer/presentation/pages/home/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/order/order.dart';
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
      gapLocation: GapLocation.none,
      // notchSmoothness: NotchSmoothness.defaultEdge,
      // leftCornerRadius: HomePageParams.bottomNavCornerRaidus,
      // rightCornerRadius: HomePageParams.bottomNavCornerRaidus,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      blurEffect: true,
      hideAnimationCurve: Curves.easeOut,
      elevation: 0,
      icons: const <IconData>[
        Icons.home_rounded,
        Icons.card_giftcard,
        Icons.money,
        Icons.person,
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
      backgroundColor: Colors.green[800],
      activeColor: Colors.greenAccent,
      inactiveColor: Colors.green[500],
    );
  }
}
