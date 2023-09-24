import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/widgets/order_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

/// {@template order_page}
/// A description for OrderPage
/// {@endtemplate}
class OrderPage extends StatelessWidget {
  /// {@macro order_page}
  const OrderPage({super.key, this.isBack});

  /// The static route for OrderPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const OrderPage());
  }

  final bool? isBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'আমার অর্ডার  সমূহ',
          style: TextStyle(
            color: priceBoxColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        // centerTitle: true,
        leading: isBack == true
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : null,
      ),
      body: RefreshIndicator(
          backgroundColor: priceBoxColor,
          color: Colors.white,
          onRefresh: () async {
            final loginState = context.read<LoginBloc>().state;
            final token = loginState is LoginSuccess
                ? loginState.successLoginEntity.token
                : '';
            if (token.isNotEmpty) {
              context.read<OrderBloc>().add(InitOrders(token));
            }
          },
          child: const OrderView(),),
    );
  }
}

/// {@template order_view}
/// Displays the Body of OrderView
/// {@endtemplate}
class OrderView extends StatelessWidget {
  /// {@macro order_view}
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrderBody();
  }
}
