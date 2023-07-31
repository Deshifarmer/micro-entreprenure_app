import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/cartz/view/cartz_page.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/pdetail/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/products/widgets/products_body.dart';
import 'package:flutter/material.dart';

/// {@template products_page}
/// A description for ProductsPage
/// {@endtemplate}
class ProductsPage extends StatelessWidget {
  /// {@macro products_page}
  const ProductsPage({super.key});

  /// The static route for ProductsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ProductsPage());
  }

  @override
  Widget build(BuildContext context) {
    const prevItem = 0;
    final cartBloc = context.read<CartBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('পণ্য কিনুন'),
        actions: const [
          CartBtnPP(),
        ],
      ),
      body: const ProductsView(),
    );
  }
}

/// {@template products_view}
/// Displays the Body of ProductsView
/// {@endtemplate}
class ProductsView extends StatelessWidget {
  /// {@macro products_view}
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductsBody();
  }
}

class CartBtnPP extends StatelessWidget {
  const CartBtnPP({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartAddingState) {
          var prevItem = 0;
          // void prevItemF() {
          for (final element in state.carts.values) {
            if (element.$2 > 0) {
              prevItem = prevItem + element.$2;
            }
          }

          return IconButton(
            onPressed: () async {
              final logINState = context.read<LoginBloc>().state;
              if (logINState is LoginSuccess) {
                context.read<MyFarmerBloc>().add(
                      MyFarmerFetchEvent(
                        logINState.successLoginEntity.token,
                      ),
                    );
              }
              await Navigator.push(
                context,
                PageAnimationWrapper.sharedAxisTransitionPageWrapper(
                  const CartzPage(),
                ),
              );
            },
            icon: Badge(
              label: Text('$prevItem'),
              child: const Icon(
                Icons.shopping_bag,
              ),
            ),
          );
        }
        return IconButton(
          onPressed: () {
            Navigator.push(
              context,
              PageAnimationWrapper.sharedAxisTransitionPageWrapper(
                const CartzPage(),
              ),
            );
          },
          icon: const Badge(
            // isLabelVisible: false,
            child: Icon(
              Icons.shopping_bag,
            ),
          ),
        );
      },
    );
  }
}
