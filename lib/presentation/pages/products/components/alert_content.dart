import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/pages/products/components/product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class AlertDialogContent extends StatelessWidget {
  const AlertDialogContent({
    required this.product, super.key,
  });

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          /// product image
          if (product.image != null)
            Hero(
              tag: product.product_id ?? '',
              child: ProductImage(product: product),
            ),

          /// product price
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "${product.sell_price ?? ''} টাকা",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Text(
            product.company ?? '',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),

          /// product category
          Text(
            product.category ?? '',
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),

          /// product description
          HtmlWidget(product.description ?? ''),
        ],
      ),
    );
  }
}
