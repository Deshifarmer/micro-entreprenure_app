import 'package:carousel_slider/carousel_slider.dart';
import 'package:deshifarmer/core/params/product_page_params.dart';
import 'package:deshifarmer/presentation/blocs/products/products_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/products/components/company_c_list_view.dart';
import 'package:deshifarmer/presentation/pages/products/widgets/product_gird_view.dart';
import 'package:flutter/material.dart';

/// {@template products_body}
/// Body of the ProductsPage.
///
/// Add what it does
/// {@endtemplate}
class ProductsBody extends StatelessWidget {
  /// {@macro products_body}
  ProductsBody({super.key});

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    return BlocConsumer<ProductsBBloc, ProductsSState>(
      listener: (context, ProductsSState state) {
        if (state is ProductSuccess) {
          // print('yesh ! doing success!');
          if (state.productEntity.data != null) {
            // _products.addAll(state.productEntity.data!);
          }
        }
      },
      builder: (context, state) {
        if (state is ProductSuccess) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController
              ..addListener(() {
                //? check if the next page is not [null]
                final nxtPage =
                    state.productEntity.links?.next?.split('=').last;
                if (_scrollController.offset >
                    _scrollController.position.maxScrollExtent * 0.8) {
                  // print('end of the page $nxtPage');
                  if (nxtPage != null) {
                    //? fetch the nxt page
                    if (loginState is LoginSuccess) {
                      // print(
                      //   'nexty page $nxtPage ${loginState.successLoginEntity.token}',
                      // );
                      context.read<ProductsBBloc>().add(
                            ProductFetchPaginationEvent(
                              nextPage: int.parse(nxtPage),
                              token: loginState.successLoginEntity.token,
                            ),
                          );
                    }
                  }
                }
              }),
            children: [
              /// company listview
              const CampanyCircularListView(),

              /// category listview
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                ),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            'test $i',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),

              /// Row -> Text, Text
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('সব পণ্য'),
                    PopupMenuButton<ProductCategorys>(
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<ProductCategorys>>[
                        const PopupMenuItem<ProductCategorys>(
                          value: ProductCategorys.seed,
                          child: Text('Seed'),
                        ),
                        const PopupMenuItem<ProductCategorys>(
                          value: ProductCategorys.pesticide,
                          child: Text('Pesticide'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// TextField
              const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    // disabledBorder: OutlineInputBorder(),
                    // focusedBorder: OutlineInputBorder(),
                    // errorBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    // focusedErrorBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'পণ্যের নাম দিয়ে পণ্য সার্চ করুন ',
                  ),
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              /// product LIST GridView

              const ProductGridViewWidgets(),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
