import 'package:animations/animations.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/pages/pdetail/view/pdetail_page.dart';
import 'package:deshifarmer/presentation/pages/products/components/product_image.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_html/flutter_html.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key,
  });

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: OpenContainer(
        // closedColor: Colors.green,
        openColor: backgroundColor2,
        closedColor: backgroundColor2,
        openElevation: 0,
        closedElevation: 0,
        middleColor: Colors.transparent,
        closedBuilder: (context, cb) {
          return Card(
            child: Column(
              children: [
                Hero(
                  tag: product.product_id ?? '',
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    height: 150,
                    // color: Colors.greenAccent,
                    // ignore: unnecessary_null_comparison
                    child: product.image != null
                        ? ProductImage(product: product)
                        : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    product.company ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        // fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
                // title
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  child: Text(
                    product.name ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                // type
                Text(
                  product.category ?? '',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),

                // ammount
                Flexible(
                  child: Text(
                    "${product.sell_price ?? ''} টাকা",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
        transitionDuration: 500.milliseconds,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        openShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        openBuilder: (
          BuildContext context,
          void Function({Object? returnValue}) action,
        ) {
          return PdetailPage(
            productData: product,
          );
        },
      ),
    );
  }
}


          //* show an Dialog of product detail (with add to cart functionality)
          /*
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // contentPadding: const EdgeInsets.all(5),
                insetPadding: const EdgeInsets.all(10),

                title: Text(product.name ?? ''),
                content: SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  child: AlertDialogContent(product: product),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      ///? add an item
                      context.read<CartBloc>().add(RemoveFromCart(
                            // quantity: 1,
                            productData: product,
                          ));
                    },
                    icon: const Icon(Icons.remove),
                  ),

                  BlocConsumer<CartBloc, CartState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is CartAddingState) {
                        if (state.carts[product.product_id]?.quantity != null) {
                          return Text(state.carts[product.product_id]!.quantity
                              .toString());
                        }
                      }
                      return Text('0');
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        ///? add an item
                        context.read<CartBloc>().add(AddtoCartEvent(
                              // quantity: 1,
                              productData: product,
                            ));
                      },
                      icon: const Icon(Icons.add)),

                  /// add to cart button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Add to Cart'),
                  ),
                ],
              );
            },
          );
          */
          //* show a bottom sheet
          // await showModalBottomSheet(
          //   isScrollControlled: true,
          //   context: context,
          //   builder: (c) {
          //     return SingleChildScrollView(
          //       padding: const EdgeInsets.all(8),
          //       child: Column(
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(
          //               product.name ?? '',
          //               style: Theme.of(context).textTheme.titleLarge,
          //             ),
          //           ),
          //           AlertDialogContent(product: product),
          //           BlocConsumer<CartBloc, CartState>(
          //             listener: (context, state) {},
          //             builder: (context, state) {
          //               return Row(
          //                 children: [
          //                   IconButton(
          //                     onPressed: () {
          //                       ///? add an item
          //                       context.read<CartBloc>().add(RemoveFromCart(
          //                             // quantity: 1,
          //                             productData: product,
          //                           ));
          //                     },
          //                     icon: const Icon(Icons.remove),
          //                   ),

          //                   if (state is CartAddingState)
          //                     if (state.carts[product.product_id]?.quantity !=
          //                         null)
          //                       Text(state.carts[product.product_id]!.quantity
          //                           .toString())
          //                     else
          //                       Text('0'),

          //                   IconButton(
          //                       onPressed: () {
          //                         ///? add an item
          //                         context.read<CartBloc>().add(AddtoCartEvent(
          //                               // quantity: 1,
          //                               productData: product,
          //                             ));
          //                       },
          //                       icon: const Icon(Icons.add)),

          //                   /// add to cart button
          //                   ElevatedButton(
          //                     onPressed: () {
          //                       Navigator.pop(context);
          //                     },
          //                     child: const Text('Add to Cart'),
          //                   ),
          //                 ],
          //               );
          //             },
          //           ),
          //         ],
          //       ),
          //     );
          // },
          // );