import 'package:deshifarmer/presentation/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/cartz/components/select_farmer_methods.dart';
import 'package:deshifarmer/presentation/pages/cartz/components/select_payment_methods.dart';
import 'package:deshifarmer/presentation/pages/products/components/product_image.dart';
import 'package:flutter/material.dart';

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
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ListView.builder(
                shrinkWrap: true,
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
                                width: 150,
                                child:
                                    ProductImage(product: currentItem.value.$1),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // column -> title, company , money
                            Column(
                              children: [
                                Text(
                                  currentItem.value.$1.name ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                                Text(currentItem.value.$1.company ?? ''),
                                Text(
                                  '${currentItem.value.$1.sell_price} টাকা' ??
                                      '',
                                )
                              ],
                            ),
                          ],
                        ),
                        // element, delete icon
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'x${currentItem.value.$2}',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                        RemoveFromCart(
                                          // quantity: 1,
                                          productData: currentItem.value.$1,
                                        ),
                                      );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),

              ///! total price
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerRight,
                child: Text('Total : ${state.getTotalPrices()} টাকা'),
              ),

              ///! select farmer

              const SelectFarmerMethods(),
              const SizedBox(
                height: 20,
              ),

              ///! payment methods
              const SelectPaymentMethods(),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
