import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/pages/products/components/alert_content.dart';
import 'package:flutter/material.dart';

/// {@template pdetail_body}
/// Body of the PdetailPage.
///
/// Add what it does
/// {@endtemplate}
class PdetailBody extends StatelessWidget {
  /// {@macro pdetail_body}
  const PdetailBody({
    required this.productData,
    super.key,
  });
  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Hero image
        AlertDialogContent(product: productData),
        // company name
        // category
        // detail (render html)
        // add to cart as bottom nav
      ],
    );
  }
}
