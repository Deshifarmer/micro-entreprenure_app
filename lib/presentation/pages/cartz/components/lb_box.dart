import 'package:deshifarmer/presentation/pages/order/order.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';

class LBPaymentBox extends StatelessWidget {
  const LBPaymentBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartItems = context.read<CartBloc>().state;
    return cartItems is CartAddingState
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'মোট',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                    ),
                    Text(
                      '৳ ${cartItems.getTotalPrices().toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ইন্টারেস্ট  - 9 %',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                    ),
                    Text(
                      '৳ ${(cartItems.getTotalPrices() * 9 / 100).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'প্লাটফর্ম ফি',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                    ),
                    Text(
                      '৳ 60',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'সর্বমোট',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '৳ ${(cartItems.getTotalPrices() + 60 + (cartItems.getTotalPrices() * 9 / 100)).toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
