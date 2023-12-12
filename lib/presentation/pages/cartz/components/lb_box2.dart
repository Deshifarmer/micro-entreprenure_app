import 'package:deshifarmer/presentation/pages/order/order.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';

class LBBox2 extends StatelessWidget {
  const LBBox2({
    super.key,
    required this.times,
  });
  final int times;

  @override
  Widget build(BuildContext context) {
    final cartItems = context.read<CartBloc>().state;
    return cartItems is CartAddingState && times > 0
        ? Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'এখন',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Nothing to pay',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                for (int i = 0; i < times; i++)
                  Container(
                    padding: const EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenHeight(5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.query_builder,
                          color: Colors.black.withOpacity(0.6),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'After ${i + 1}  week',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '৳ ${((cartItems.getTotalPrices() + 60 + (cartItems.getTotalPrices() * 9 / 100)) / times).toStringAsFixed(2)}',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          )
        : SizedBox.shrink();
  }
}
