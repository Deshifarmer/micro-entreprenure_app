import 'package:deshifarmer/domain/entities/category_entity/category_entity.dart';
import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/blocs/category/category_bloc.dart';
import 'package:deshifarmer/presentation/blocs/products/products_bloc.dart';
import 'package:deshifarmer/presentation/pages/demands/demands.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/products_bloc.dart';
import 'package:deshifarmer/presentation/pages/products/components/product_card.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class CompanyProducts extends StatelessWidget {
  CompanyProducts({
    required this.companyName,
    required this.companyID,
    super.key,
  });
  final String companyName;
  final String companyID;

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;

    final productState = context.read<ProductsBloc>().state;
    final categoryState = context.read<CategoryBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text(companyName),
        surfaceTintColor: backgroundColor2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                      top: 10,
                      right: 10,
                    ),

                    ///! PERF: Searching Text Field
                    child: TextField(
                      onChanged: (value) {
                        ///! PERF: 1st. check if theres any company/cat already select
                        if (productState is ProductComanySelect) {
                          if (loginState is LoginSuccess) {
                            ///! TODO: uncomment this
                            // context.read<ProductsBBloc>().add(
                            //       ProductSearchEvent(
                            //         loginState.successLoginEntity.token,
                            //         query: value.isEmpty ? '' : value,
                            //         cat: productState.category,
                            //         company: companyID,
                            //         // cat: productState.category,
                            //         // company: productState.companyID,
                            //       ),
                            //     );
                          }
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(uiBorderRadius),
                        ),
                        // focusedErrorBorder: OutlineInputBorder(),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xff757575),
                        ),
                        hintText: 'পণ্যের নাম দিয়ে পণ্য সার্চ করুন ',
                        filled: true,
                        fillColor: Colors.white70,
                        hintStyle: const TextStyle(
                          color: Color(0xff6a6a6a),
                        ),
                      ),
                    ),
                  ),
                ),
                if (categoryState is CategorySuccess)

                  ///! PERF: categories
                  PopupMenuButton<CategoryEntity>(
                    padding: EdgeInsets.zero,
                    // surfaceTintColor: primaryColor,
                    onSelected: (CategoryEntity value) {
                      // print('cat -> ${value.title} ${value.id}');
                      if (productState is ProductComanySelect) {
                        // context.read<ProductsBloc>().add(
                        //       SelectCompanysEvent(
                        //         productState.companyID,
                        //         category: value.id.toString(),
                        //         query: productState.query,
                        //       ),
                        //     );
                        if (loginState is LoginSuccess) {
                          ///! TODO: uncomment this
                          // context.read<ProductsBBloc>().add(
                          //       ProductSearchEvent(
                          //         loginState.successLoginEntity.token,
                          //         cat: value.id.toString(),
                          //         company: companyID,
                          //         query: productState.query,
                          //       ),
                          //     );
                        }

                        // print('category -> ${productState.category}');
                        // print('query -> ${productState.query}');
                        // print('company -> ${productState.companyID}');
                      }
                    },
                    enableFeedback: true,
                    surfaceTintColor: backgroundColor2,
                    itemBuilder: (BuildContext context) =>
                        categoryState.allCategoryListResp.category
                            .map(
                              (CategoryEntity e) =>
                                  PopupMenuItem<CategoryEntity>(
                                value: e,
                                child: Text(e.title.split('-').last),
                              ),
                            )
                            .toList(),
                    color: backgroundColor2,
                    icon: Container(
                      // margin: EdgeInsets.all(0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          width: 0.6,
                          // strokeAlign: 0.6,
                          color: Colors.grey,
                        ),
                      ),
                      child: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: BlocConsumer<ProductsBBloc, ProductsSState>(
                listener: (context, ProductsSState state) {},
                builder: (context, state) {
                  ///! TODO: uncomment this
                  if (state is ProductSSuccess) {
                    // final companyState = context.read<ProductsBloc>().state;
                    return BlocConsumer<ProductsBloc, ProductsState>(
                      listener: (context, companyState) {},
                      builder: (context, companyState) {
                        final List<ProductData> allProducts;
                        allProducts = state.productDatas;
                        if (allProducts.isEmpty) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: getProportionateScreenHeight(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error,
                                  size: 50,
                                ),
                                Center(child: Text('No Product Found')),
                              ],
                            ),
                          );
                        }

                        return GridView.builder(
                          // shrinkWrap: true,
                          controller: _scrollController
                            ..addListener(() {
                              if (_scrollController.offset >
                                  _scrollController.position.maxScrollExtent *
                                      0.8) {
                                final pb = context.read<ProductsBBloc>().state;
                                // print('goin 60% of the screen -> $pb');
                                ///! TODO: uncomment this
                                // if (pb is ProductSSuccess) {
                                //   // print('success productsssssssss');
                                //   if (pb.productEntity.links?.next != null) {
                                //     //? fetch the nxt page
                                //     if (loginState is LoginSuccess) {
                                //       // print(
                                //       //   'nexty page ${pb.productEntity.links?.next} ${loginState.successLoginEntity.token}',
                                //       // );
                                //       context.read<ProductsBBloc>().add(
                                //             ProductFFetchPaginationEvent(
                                //               nextPage:
                                //                   pb.productEntity.links!.next!,
                                //               token: loginState
                                //                   .successLoginEntity.token,
                                //             ),
                                //           );
                                //     }
                                //   }
                                // } else {
                                //   print('not success product');
                                // }
                              }
                            }),
                          itemCount: allProducts.length,
                          physics: const BouncingScrollPhysics(),
                          primary: false,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 320,
                          ),
                          itemBuilder: (context, index) {
                            final product = allProducts.elementAt(index);
                            return ProductCard(product: product);
                          },
                        );
                      },
                    );
                  }
                  // return
                  ///! TODO: uncomment this
                  if (state is ProductFFailed) {
                    return const Center(
                      child: Text('Failed'),
                    );
                  }

                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 35,
                    ),
                    child: const PrimaryLoadingIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
