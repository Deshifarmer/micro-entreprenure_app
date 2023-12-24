import 'package:deshifarmer/domain/entities/products_entity/product_data_entity.dart';
import 'package:deshifarmer/presentation/animations/page_animations.dart';

import 'package:deshifarmer/presentation/pages/cartz/view/cartz_page.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/pdetail/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/pdetail/widgets/pdetail_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/services/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/services/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:flutter/material.dart';

/// {@template pdetail_page}
/// A description for PdetailPage
/// {@endtemplate}
class PdetailPage extends StatefulWidget {
  /// {@macro pdetail_page}
  const PdetailPage({
    required this.productData,
    super.key,
  });
  final ProductData productData;

  @override
  State<PdetailPage> createState() => _PdetailPageState();
}

class _PdetailPageState extends State<PdetailPage> {
  /// The static route for PdetailPage
  // static Route<dynamic> route() {
  //   return MaterialPageRoute<dynamic>(builder: (_) => const PdetailPage(
  //     productData: ,
  //   ));
  // }
  int _itemBag = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productData.name ?? ''),
        actions: [
          BlocConsumer<CartBloc, CartState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is CartAddingState) {
                var prevItem = 0;
                // void prevItemF() {
                for (final element in state.carts.values) {
                  if (element.$2 > 0) {
                    prevItem = prevItem + element.$2;
                  }
                }

                return IconButton(
                  onPressed: () async {
                    final logINState = context.read<LoginBloc>().state;
                    if (logINState is LoginSuccess) {
                      context.read<MyFarmerBloc>().add(
                            MyFarmerFetchEvent(
                              logINState.successLoginEntity.token,
                            ),
                          );
                    }
                    await Navigator.push(
                      context,
                      PageAnimationWrapper.sharedAxisTransitionPageWrapper(
                        const CartzPage(),
                      ),
                    );
                  },
                  icon: Badge(
                    label: Text('$prevItem'),
                    // isLabelVisible: false,
                    child: const Icon(
                      Icons.shopping_bag,
                    ),
                  ),
                );
              }
              return IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageAnimationWrapper.sharedAxisTransitionPageWrapper(
                      const CartzPage(),
                    ),
                  );
                },
                icon: const Badge(
                  // isLabelVisible: false,
                  child: Icon(
                    Icons.shopping_bag,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: PdetailView(
        productData: widget.productData,
      ),
      // floatingActionButton:
      bottomNavigationBar: BottomAppBar(
        color: priceBoxColor.withOpacity(
          0.1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (_itemBag > 0) {
                    --_itemBag;
                  }
                });
              },
              icon: const Icon(Icons.remove),
            ),

            Text(
              _itemBag.toString(),
            ),

            IconButton(
              onPressed: () {
                setState(() {
                  ++_itemBag;
                });
              },
              icon: const Icon(Icons.add),
            ),

            /// add to cart button
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width / 2, 80),
                ),
                backgroundColor: const MaterialStatePropertyAll(priceBoxColor),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                for (var i = 0; i < _itemBag; i++) {
                  // print(i);
                  ///? add an item
                  context.read<CartBloc>().add(
                        AddtoCartEvent(
                          // quantity: 1,
                          productData: widget.productData,
                        ),
                      );
                }
                if (_itemBag == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('পণ্য যোগ করা হয়নি'),
                      backgroundColor: Colors.red[500],
                    ),
                  );
                }
                if (_itemBag > 0) {
                  // context.read<CartBloc>().add(
                  //       CartAddingEvent(),
                  //     );
                  // show snackbar when item added
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('পণ্য কার্ট এ যোগ হয়েছে'),
                      backgroundColor: priceBoxColor,
                    ),
                  );
                }
                setState(() {
                  _itemBag = 0;
                });
              },
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
            // remove button
            // quantity
            // add button
            // add to cart button
          ],
        ),
      ),
    );
  }
}

/// {@template pdetail_view}
/// Displays the Body of PdetailView
/// {@endtemplate}
class PdetailView extends StatelessWidget {
  /// {@macro pdetail_view}
  const PdetailView({
    required this.productData,
    super.key,
  });
  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return PdetailBody(
      productData: productData,
    );
  }
}
