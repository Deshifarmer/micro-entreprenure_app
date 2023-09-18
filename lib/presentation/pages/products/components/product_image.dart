import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    required this.product,
    super.key,
  });

  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage${product.image}',
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Text(
              'Image Error',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.redAccent,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          );
        },
      ),
    );
  }
}
