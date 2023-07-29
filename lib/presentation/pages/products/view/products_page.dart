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
    return Scaffold(
      appBar: AppBar(
        title: const Text('পণ্য কিনুন'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
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
