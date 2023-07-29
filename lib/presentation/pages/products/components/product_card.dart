import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:flutter/material.dart';

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
  }
}
