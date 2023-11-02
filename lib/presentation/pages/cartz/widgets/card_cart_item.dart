import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';

class CartCard2 extends StatelessWidget {
  const CartCard2({
    required this.productData,
    required this.items,
    super.key,
  });

  final ProductData productData;
  final int items;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // child: Image.network(productData.image),
                  child: CachedNetworkImage(
                    imageUrl: checkDomain(
                      Strings.getServerOrLocal(
                        ServerOrLocal.server,
                      ),
                    )
                        ? dummyImage
                        : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${productData.image}',
                    height: 50,
                    width: 50,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: Colors.green[600],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${productData.name!.substring(
                    0,
                    productData.name!.length > 22
                        ? 22
                        : productData.name!.length,
                  )}${productData.name!.length > 22 ? "..." : ""}',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text.rich(
                  TextSpan(
                    text: '৳${productData.sell_price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
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
            // IconButton(
            //   onPressed: () {
            //     context.read<CartBloc>().add(
            //           RemoveFromCart(
            //             // quantity: 1,
            //             productData: productData,
            //           ),
            //         );
            //   },
            //   icon: const Icon(
            //     Icons.delete,
            //     color: Colors.red,
            //   ),
            // ),
          ],
        ),
        Positioned(
          // alignment: Alignment.bottomRight,
          bottom: getProportionateScreenHeight(30),
          right: 0,
          child: IconButton(
            onPressed: () {
              context.read<CartBloc>().add(
                    RemoveFromCart(
                      // quantity: 1,
                      productData: productData,
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
    );
  }
}
