import 'package:animations/animations.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/view/add_farmer_page.dart';
import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/commision/view/commision_page.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/view/farmadd_form_page.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/farmer_listo.dart';
import 'package:deshifarmer/presentation/pages/home/bloc/home_bloc.dart';
import 'package:deshifarmer/presentation/pages/home/components/home_bottom_nav.dart';
import 'package:deshifarmer/presentation/pages/home/widgets/home_body.dart';
import 'package:deshifarmer/presentation/pages/order/view/order_page.dart';
import 'package:deshifarmer/presentation/pages/profile/view/profile_page.dart';
import 'package:deshifarmer/presentation/pages/profile/widgets/profile_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    return Scaffold(
      backgroundColor: const Color(0xffF5F8FF),
      // body: HomeView(),
      body: state is HomeInitial
          ? const HomeView()
          : state is MyOrderPageState
              ? const FarmerListoPage()
              : state is CommisionPageState
                  ? const OrderPage()
                  : const ProfilePage(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   // make it circle
      //   shape: const CircleBorder(),
      //   // background color to tertiary color
      //   backgroundColor: tertiaryColor,
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButton: OpenContainer(
        closedBuilder: (context, action) {
          return FloatingActionButton(
            // make it circle
            shape: const CircleBorder(),
            // background color to tertiary color
            backgroundColor: tertiaryColor,
            onPressed: action,
            child: const Icon(Icons.add),
          );
        },
        closedColor: Colors.transparent,
        openColor: Colors.transparent,
        middleColor: Colors.transparent,
        openElevation: 0,
        closedElevation: 0,
        openBuilder: (context, action) {
          return const AddFarmerPage();
        },
      ),
      bottomNavigationBar: const HomeBottomNav(),
    );
  }
}

/// {@template home_view}
/// Displays the Body of HomeView
/// {@endtemplate}
class HomeView extends StatelessWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeBody();
  }
}
