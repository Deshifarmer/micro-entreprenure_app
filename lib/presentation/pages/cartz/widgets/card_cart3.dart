import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class CartCard3 extends StatelessWidget {
  const CartCard3({
    required this.productData,
    required this.items,
    super.key,
  });

  final ProductData productData;
  final int items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(70),
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
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
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
              productData.name!.substring(
                0,
                productData.name!.length > 25 ? 25 : productData.name!.length,
              ),
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Text.rich(
              TextSpan(
                text: '৳ ${productData.sell_price}',
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
        Text('QTY x $items'),
      ],
    );
  }
}
