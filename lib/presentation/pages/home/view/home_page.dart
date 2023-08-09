import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/commision/view/commision_page.dart';
import 'package:deshifarmer/presentation/pages/home/bloc/home_bloc.dart';
import 'package:deshifarmer/presentation/pages/home/components/home_bottom_nav.dart';
import 'package:deshifarmer/presentation/pages/home/widgets/home_body.dart';
import 'package:deshifarmer/presentation/pages/order/view/order_page.dart';
import 'package:deshifarmer/presentation/pages/profile/widgets/profile_body.dart';
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
      backgroundColor: Color(0xffF5F8FF),
      // body: HomeView(),
      body: state is HomeInitial
          ? const HomeView()
          : state is MyOrderPageState
              ? const OrderPage()
              : state is CommisionPageState
                  ? const CommisionPage()
                  : const ProfileBody(),
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
