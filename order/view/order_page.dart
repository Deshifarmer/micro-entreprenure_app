import 'package:deshifarmer/presentation/pages/order/widgets/order_body.dart';
import 'package:flutter/material.dart';

/// {@template order_page}
/// A description for OrderPage
/// {@endtemplate}
class OrderPage extends StatelessWidget {
  /// {@macro order_page}
  const OrderPage({super.key});

  /// The static route for OrderPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const OrderPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OrderView(),
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
