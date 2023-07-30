import 'package:deshifarmer/presentation/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/presentation/pages/products/components/product_image.dart';
import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';

/// {@template cartz_body}
/// Body of the CartzPage.
///
/// Add what it does
/// {@endtemplate}
class CartzBody extends StatelessWidget {
  /// {@macro cartz_body}
  const CartzBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartAddingState) {
          final itemToList = state.carts.entries.toList();
          return ListView.builder(
            itemCount: itemToList.length,
            itemBuilder: (context, index) {
              final currentItem = itemToList.elementAt(index);
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // product row (iamge, Column -> title, company, money)
                    Row(
                      children: [
                        // image
                        Hero(
                          tag: currentItem.value.$1.product_id ?? '',
                          child: SizedBox(
                            height: 100,
                            child: ProductImage(product: currentItem.value.$1),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        // column -> title, company , money
                        Column(
                          children: [
                            Text(currentItem.value.$1.name ?? ''),
                            Text(currentItem.value.$1.company ?? ''),
                            Text(
                                "${currentItem.value.$1.sell_price} টাকা" ?? '')
                          ],
                        ),
                      ],
                    ),
                    // element, delete icon
                    Column(
                      children: [
                        Text(
                          'x${currentItem.value.$2}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<CartBloc>().add(RemoveFromCart(
                                  // quantity: 1,
                                  productData: currentItem.value.$1,
                                ));
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
