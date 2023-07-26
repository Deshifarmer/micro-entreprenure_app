import 'package:carousel_slider/carousel_slider.dart';
import 'package:deshifarmer/core/params/product_page_params.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/products/components/company_c_list_view.dart';
import 'package:flutter/material.dart';

/// {@template products_body}
/// Body of the ProductsPage.
///
/// Add what it does
/// {@endtemplate}
class ProductsBody extends StatelessWidget {
  /// {@macro products_body}
  const ProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return ListView(
          physics: const BouncingScrollPhysics(),
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
                          'text $i',
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
            GridView.builder(
              shrinkWrap: true,
              itemCount: 20,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisExtent: 80,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        color: Colors.greenAccent,
                      ),
                      // title
                      const Text('product title'),
                      // type
                      const Text('seed'),

                      // ammount
                      const Text('200 BDT'),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
