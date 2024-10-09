import 'package:deshifarmer/domain/entities/orders_entity/order_response_entity.dart';
import 'package:deshifarmer/presentation/shapes/carrot_shape.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class UnfullfiledOrderListCard extends StatelessWidget {
  const UnfullfiledOrderListCard({
    required this.singleOrder,
    super.key,
  });

  final OrderEntity singleOrder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        /// a green box with rounded border
                        Container(
                          height: getProportionateScreenHeight(25),
                          width: getProportionateScreenWidth(25),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5),
                            // shape: BoxShape.circle,
                          ),
                          // child: CustomPaint(
                          //   painter: CarrotShape(),
                          //   size: Size(100, 100),
                          // ),
                        ),

                        /// order id, name, phone
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                            vertical: getProportionateScreenHeight(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///! order id and a dot sign
                              Row(
                                children: [
                                  Text(
                                    '#${singleOrder.order_id}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),

                                  /// a dot sign to show order status
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: singleOrder.status == 'pending'
                                          ? Colors.red
                                          : singleOrder.status ==
                                                  'confirm by df cp'
                                              ? Colors.yellow
                                              : singleOrder.status ==
                                                      'processing by company'
                                                  ? Colors.blue
                                                  : singleOrder.status ==
                                                          'ready to collect for distributor'
                                                      ? Colors.orange
                                                      : singleOrder.status ==
                                                              'ready to collect for me'
                                                          ? const Color(
                                                              0xfff1e826,)
                                                          : Colors.green,
                                    ),
                                  ),
                                ],
                              ),

                              /// farmer name and phone
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8),
                                    child: CustomPaint(
                                      painter: MyFarmersShape(
                                        colorF: Color(0xff7D4600),
                                      ),
                                      size: Size(15, 15),
                                    ),
                                  ),
                                  Text(
                                    singleOrder.farmer_details?.farmer_name ??
                                        '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            // fontWeight: FontWeight.w500,
                                            ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Icon(
                                      Icons.phone_forwarded,
                                      size: 13,
                                    ),
                                  ),
                                  Text(
                                    singleOrder.farmer_details?.farmer_phone ??
                                        '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            // fontWeight: FontWeight.w500,
                                            ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 10,
                      left: 5,
                      child: CustomPaint(
                        painter: CarrotShape(),
                        size: const Size(30, 30),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '৳ ${singleOrder.total_price}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(singleOrder.farmer_details?.farmer_address ?? ''),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (singleOrder.status == 'collected by me')
          const Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.verified,
              color: primaryColor,
            ),
          ),
      ],
    );
  }
}
