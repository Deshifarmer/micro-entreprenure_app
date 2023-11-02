import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    required this.items,
    required this.product,
    super.key,
  });
  final int items;
  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Hero(
                    tag: product.product_id ?? '',
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: checkDomain(
                          Strings.getServerOrLocal(ServerOrLocal.server),
                        )
                            ? dummyImage
                            : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage${product.image}',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                Center(
                                  child: CircularProgressIndicator(
                                                          value: downloadProgress.progress,
                                                          color: Colors.green[600],
                                                        ),
                                ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.8,
                    child: Text(
                      product.name ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.7,
                    child: Text(
                      product.company ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        overflow: TextOverflow.fade,
                        height: 1,
                      ),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: '৳${product.sell_price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        // color: kPrimaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: ' x$items',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ///! remove buton
              // Expanded(
              //   child: IconButton(
              //     onPressed: () {
              //       context.read<CartBloc>().add(
              //             RemoveFromCart(
              //               // quantity: 1,
              //               productData: product,
              //             ),
              //           );
              //     },
              //     icon: const Icon(
              //       Icons.delete,
              //       color: Colors.red,
              //     ),
              //   ),
              // ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                context.read<CartBloc>().add(
                      RemoveFromCart(
                        // quantity: 1,
                        productData: product,
                      ),
                    );
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
