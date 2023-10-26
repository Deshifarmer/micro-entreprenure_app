import 'package:animations/animations.dart';
import 'package:deshifarmer/core/connections/core_connections.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/view/add_farmer_page.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/farmer_listo.dart';
import 'package:deshifarmer/presentation/pages/home/widgets/home_body.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/view/order_page.dart';
import 'package:deshifarmer/presentation/pages/profile/view/profile_page.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatefulWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with
        ConnectionAwareMixin<HomePage>,
        DefaultConnectionAwareStateMixin<HomePage>
    implements RestartableStateInterface {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeView(),
    FarmerListoPage(),
    OrderPage(),
    ProfilePage(),
  ];
  final icons = const <IconData>[
    Icons.view_carousel_outlined,
    Icons.cake_outlined,
    Icons.reorder,
    Icons.account_circle_outlined,
  ];
  // @override
  // Widget build(BuildContext context) {
  //   // final state = context.watch<HomeBloc>().state;
  //   return ;
  // }

  @override
  Widget buildPage(BuildContext context) => Scaffold(
        // maintainBottomViewPadding: true,
        extendBody: true,
        backgroundColor: const Color(0xffF5F8FF),
        // body: HomeView(),
        body: PageTransitionSwitcher(
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: _pages[_currentIndex],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          closedShape: const CircleBorder(),
          transitionDuration: const Duration(milliseconds: 500),
          openShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          openBuilder: (context, action) {
            return const AddFarmerPage();
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: tertiaryColor,
          shape: const CircularNotchedRectangle(),
          // height: getProportionateScreenHeight(90),
          padding: const EdgeInsets.all(0),
          // notchMargin: 10,
          // clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        final loginState = context.read<LoginBloc>().state;
                        final token = loginState is LoginSuccess
                            ? loginState.successLoginEntity.token
                            : null;

                        context.read<OrderBloc>().add(InitOrders(token ?? ''));
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      icon: Icon(
                        Icons.home,
                        color: _currentIndex == 0 ? Colors.white : Colors.grey,
                      ),
                    ),
                    Text(
                      'হোম',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color:
                                _currentIndex == 0 ? Colors.white : Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        final loginState = context.read<LoginBloc>().state;
                        final token = loginState is LoginSuccess
                            ? loginState.successLoginEntity.token
                            : null;
                        context.read<MyFarmerBloc>().add(
                              MyFarmerFetchEvent(token ?? ''),
                            );
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      icon: CustomPaint(
                        painter: MyFarmersShape(
                          colorF:
                              _currentIndex == 1 ? Colors.white : Colors.grey,
                        ),
                        size: const Size(20, 20),
                      ),
                    ),
                    Text(
                      'কৃষক তালিকা',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color:
                                _currentIndex == 1 ? Colors.white : Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ), // this will handle the fab spacing
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        final loginState = context.read<LoginBloc>().state;
                        final token = loginState is LoginSuccess
                            ? loginState.successLoginEntity.token
                            : null;
                        //     if (x == 2 || x == 0) {
                        context.read<OrderBloc>().add(InitOrders(token ?? ''));
                        //     }
                        //     if (x == 1) {
                        //       context.read<MyFarmerBloc>().add(
                        //             MyFarmerFetchEvent(token ?? ''),
                        //           );
                        //     }
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      icon: Icon(
                        Icons.reorder,
                        color: _currentIndex == 2 ? Colors.white : Colors.grey,
                      ),
                    ),
                    Text(
                      'অর্ডার তালিকা',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color:
                                _currentIndex == 2 ? Colors.white : Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 3;
                        });
                      },
                      icon: Icon(
                        Icons.account_circle_outlined,
                        color: _currentIndex == 3 ? Colors.white : Colors.grey,
                      ),
                    ),
                    Text(
                      'প্রোফাইল',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color:
                                _currentIndex == 3 ? Colors.white : Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

/// {@template home_view}
///
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
