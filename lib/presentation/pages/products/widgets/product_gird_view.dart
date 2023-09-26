import 'package:deshifarmer/presentation/blocs/products/products_bloc.dart';
import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/products_bloc.dart';
import 'package:deshifarmer/presentation/pages/products/components/product_card.dart';
import 'package:flutter/material.dart';

class ProductGridViewWidgets extends StatelessWidget {
  const ProductGridViewWidgets({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBBloc, ProductsSState>(
      listener: (context, ProductsSState state) {},
      builder: (context, state) {
        if (state is ProductSSuccess) {
          // final companyState = context.read<ProductsBloc>().state;
          return BlocConsumer<ProductsBloc, ProductsState>(
            listener: (context, companyState) {},
            builder: (context, companyState) {
              final allProducts = companyState is ProductComanySelect
                  ? state.productDatas
                      .where(
                        (element) =>
                            element.company_id == companyState.companyID,
                      )
                      .toList()
                  : state.productDatas;
              return GridView.builder(
                shrinkWrap: true,
                itemCount: allProducts.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 320,
                ),
                itemBuilder: (context, index) {
                  final product = allProducts.elementAt(index);
                  return ProductCard(product: product);
                },
              );
            },
          );
        }
        // return

        if (state is ProductFailed) {
          return const Center(
            child: Text('Failed'),
          );
        }

        return Center(
          child: CircularProgressIndicator(
            color: Colors.green[600],
          ),
        );
      },
    );
  }
}
