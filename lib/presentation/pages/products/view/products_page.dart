import 'package:deshifarmer/presentation/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/pdetail/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/products/components/cart_btn_components.dart';
import 'package:deshifarmer/presentation/pages/products/widgets/pbody_2.dart';
import 'package:deshifarmer/presentation/pages/products/widgets/pbody_3.dart';
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
    // const prevItem = 0;
    // final cartBloc = context.read<CartBloc>().state;
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
    final loginState = context.read<LoginBloc>().state;
    final token =
        (loginState is LoginSuccess) ? loginState.successLoginEntity.token : '';
    return ProductsBody3(
      token: token,
    );
  }
}
