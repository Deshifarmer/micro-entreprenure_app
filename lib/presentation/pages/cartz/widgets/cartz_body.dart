import 'package:deshifarmer/presentation/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/cartz/components/select_farmer_methods.dart';
import 'package:deshifarmer/presentation/pages/cartz/components/select_payment_methods.dart';
import 'package:deshifarmer/presentation/pages/cartz/widgets/card_cart_item.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
// import 'package:deshifarmer/presentation/pages/cartz/widgets/cart_compocard.dart';
import 'package:flutter/material.dart';

/// {@template cartz_body}
/// Body of the CartzPage.
///
/// Add what it does
/// {@endtemplate}
class CartzBody extends StatelessWidget {
  /// {@macro cartz_body}
  const CartzBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CartAddingState) {
          final itemToList = state.carts.entries.toList();
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: itemToList.length,
                itemBuilder: (context, index) {
                  final currentItem = itemToList.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: CartCard2(
                      items: currentItem.value.$2,
                      productData: currentItem.value.$1,
                    ),
                  );
                },
              ),
              // CartCard2(
              //     // items: 234,
              //     // product: ,
              //     ),
              ///! total price
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerRight,
                child: Text('সর্বমোট : ${state.getTotalPrices()} টাকা'),
              ),

              ///! select farmer

              const SelectFarmerMethods(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),

              ///! payment methods
              const SelectPaymentMethods(),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
