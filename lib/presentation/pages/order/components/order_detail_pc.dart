import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailsProductCard extends StatelessWidget {
  const OrderDetailsProductCard({
    required this.orderStatus,
    required this.orderID,
    // required this.paymentMethod,
    required this.placedOn,
    super.key,
  });

  final String orderStatus;
  final String placedOn;
  // final String paymentMethod;
  final String orderID;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // delevary info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// order
              const Row(
                children: [
                  Icon(
                    Icons.label_important,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'অর্ডার নম্বর',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),

              /// id
              Text(orderID),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'অর্ডারের অবস্থা',
                  // 'Order Status',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  orderStatus,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'স্থাপিত',
                  // 'Placed On',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  // DateTime.parse(placedOn),
                  DateFormat('yyyy-MM-dd')
                      .format(DateTime.parse(placedOn))
                      .toString(),
                  // '26 June, 2023',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.all(8),
          //       child: Text(
          //         'Payment Method',
          //         style: TextStyle(
          //           fontSize: 10,
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(8),
          //       child: Text(
          //         paymentMethod,
          //         style: TextStyle(
          //           fontSize: 10,
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
