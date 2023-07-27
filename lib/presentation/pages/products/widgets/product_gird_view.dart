import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/blocs/products/products_bloc.dart';
import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/products_bloc.dart';
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
        if (state is ProductSuccess) {
          final companyState = context.read<ProductsBloc>().state;
          final allProducts = companyState is ProductComanySelect
              ? state.productDatas
                  .where(
                      (element) => element.company_id == companyState.companyID)
                  .toList()
              : state.productDatas;
          return GridView.builder(
            shrinkWrap: true,
            itemCount: allProducts.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 300,
            ),
            itemBuilder: (context, index) {
              final product = allProducts.elementAt(index);
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        // color: Colors.greenAccent,
                        // ignore: unnecessary_null_comparison
                        child: product.image != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '${Strings.domain}/storage${product.image}',
                                ),
                              )
                            : null,
                      ),

                      // title
                      Text(
                        product.name ?? '',
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                      // type
                      Text(
                        product.category ?? '',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                      ),

                      // ammount
                      Text("${product.sell_price ?? ''} টাকা"),
                    ],
                  ),
                ),
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

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
