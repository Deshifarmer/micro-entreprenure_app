// import 'package:deshifarmer/presentation/blocs/products/products_bloc.dart';
// import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
// import 'package:deshifarmer/presentation/pages/products/components/product_card.dart';
// import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
// import 'package:flutter/material.dart';

// class ProductGridViewWidgets extends StatelessWidget {
//   const ProductGridViewWidgets({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ProductsBBloc, ProductsSState>(
//       listener: (context, ProductsSState state) {},
//       builder: (context, state) {
//         if (state is ProductSSuccess) {
//           // final companyState = context.read<ProductsBloc>().state;
//           return BlocConsumer<ProductsBBloc, ProductsSState>(
//             listener: (context, productState) {},
//             builder: (context, productState) {
//               // final allProducts = companyState is ProductComanySelect
//               //     ? state.productDatas
//               //         .where(
//               //           (element) =>
//               //               element.company_id == companyState.companyID,
//               //         )
//               //         .toList()
//               //     : state.productDatas;
//               if (productState is ProductSSuccess) {
//                 return GridView.builder(
//                   shrinkWrap: true,
//                   itemCount: productState.productDatas.length,
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisExtent: 320,
//                   ),
//                   itemBuilder: (context, index) {
//                     final product = productState.productDatas.elementAt(index);
//                     return ProductCard(product: product);
//                   },
//                 );
//               } else {
//                 return const Center(
//                   child: Text('Failed'),
//                 );
//               }
//               // return GridView.builder(
//               //   shrinkWrap: true,
//               //   itemCount: allProducts.length,
//               //   physics: const NeverScrollableScrollPhysics(),
//               //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               //     crossAxisCount: 2,
//               //     mainAxisExtent: 320,
//               //   ),
//               //   itemBuilder: (context, index) {
//               //     final product = allProducts.elementAt(index);
//               //     return ProductCard(product: product);
//               //   },
//               // );
//             },
//           );
//         }
//         // return

//         if (state is ProductFFailed) {
//           return const Center(
//             child: Text('Failed'),
//           );
//         }

//         return const Center(
//           child: PrimaryLoadingIndicator(),
//         );
//       },
//     );
//   }
// }
