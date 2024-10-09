import 'package:animations/animations.dart';
import 'package:deshifarmer/domain/entities/orders_entity/order_response_entity.dart';
import 'package:deshifarmer/presentation/pages/order/components/accept_orderbutton.dart';
import 'package:deshifarmer/presentation/pages/order/pages/view_order_details.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:flutter/material.dart';

class LastStageOrderList extends StatelessWidget {
  const LastStageOrderList({
    required this.readyToCollectForMe, required this.token, super.key,
  });

  final List<OrderEntity> readyToCollectForMe;
  final String token;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          readyToCollectForMe.length > 20 ? 20 : readyToCollectForMe.length,
      itemBuilder: (c, i) {
        final singleOrder = readyToCollectForMe.elementAt(i);
        return OpenContainer(
          closedBuilder: (context, action) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// order id, dot sign and farmer address in Row
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                padding: const EdgeInsets.only(
                                  left: 5,
                                ),
                                child: Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: singleOrder.status == 'pending'
                                      ? Colors.red
                                      : singleOrder.status == 'confirm by df cp'
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
                                                          0xfff1e826,
                                                        )
                                                      : Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${singleOrder.farmer_details?.farmer_address}',
                          ),
                        ],
                      ),
                    ),

                    /// farmer name
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Row(
                        children: [
                          /// custom farmer shape
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
                            singleOrder.farmer_details?.farmer_name ?? '',
                          ),
                        ],
                      ),
                    ),

                    /// farmer phone
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 5,
                      ),
                      child: Row(
                        children: [
                          /// call icon
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.phone_forwarded,
                              size: 13,
                            ),
                          ),
                          Text(
                            singleOrder.farmer_details?.farmer_phone ?? '',
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),

                        /// two buttons one accept and another reject

                        AcceptOrderButton(
                          orderID: singleOrder.order_id ?? '',
                          token: token,
                        ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   child: const Text(
                        //     'অর্ডার প্রত্যাখ্যান করুন',
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.red,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius:
                        //           BorderRadius.circular(5),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          closedColor: Colors.transparent,
          closedElevation: 0,
          openColor: Colors.transparent,
          middleColor: Colors.transparent,
          openElevation: 0,
          openBuilder: (context, action) {
            return ViewOrderDetail(
              orderID: singleOrder.order_id ?? '',
            );
          },
        );
      },
    );
  }
}
