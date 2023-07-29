import 'package:deshifarmer/data/models/cart_model.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/presentation/pages/products/components/alert_content.dart';
import 'package:deshifarmer/presentation/pages/products/components/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
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
      child: InkWell(
        onTap: () async {
          //* show an Dialog of product detail (with add to cart functionality)
          await showDialog(
            context: context,
            builder: (context) {
              return BlocConsumer<CartBloc, CartState>(
                listener: (context, state) {},
                builder: (context, state) {
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
                        onPressed: () {},
                        icon: const Icon(Icons.remove),
                      ),
                      if (state is CartAddingState)
                        if (state.carts.containsKey(product.product_id))
                          Text(
                            state.carts[product.product_id]!.quantity
                                .toString(),
                          )
                        else
                          const Text('0')
                      else
                        const Text('0'),
                      IconButton(
                          onPressed: () {
                            ///? add an item
                            // context.read<CartBloc>().add(AddtoCartEvent(quantity: product));
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
            },
          );
        },
        child: Card(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                height: 150,
                // color: Colors.greenAccent,
                // ignore: unnecessary_null_comparison
                child: product.image != null
                    ? ProductImage(product: product)
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.company ?? '',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      // fontStyle: FontStyle.italic,
                      ),
                ),
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
      ),
    );
  }
}
