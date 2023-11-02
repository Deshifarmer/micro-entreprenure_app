import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/cartz/view/cartz_page.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/services/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/services/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:flutter/material.dart';

class CartBtnPP extends StatelessWidget {
  const CartBtnPP({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartAddingState) {
          var prevItem = 0;
          // void prevItemF() {
          for (final element in state.carts.values) {
            if (element.$2 > 0) {
              prevItem = prevItem + element.$2;
            }
          }
          if (prevItem == 0) {
            // ScaffoldMessenger.of(context)
            //     .showSnackBar(errorSnackBar('Cart is empty'));
          }
        }
      },
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
              // print('prev item -> $prevItem')
              if (prevItem > 0) {
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
              }
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
