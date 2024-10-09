import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/pages/view_order_details.dart';
import 'package:deshifarmer/presentation/shapes/carrot_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/error_button.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';

class MyOrderCard extends StatelessWidget {
  const MyOrderCard({
    required this.orderID,
    required this.farmerName,
    required this.orderPrice,
    required this.farmerPhone,
    required this.farmerAddress,
    required this.status,
    super.key,
  });

  final String orderID;
  final String farmerName;
  final String farmerPhone;
  final String status;
  final String farmerAddress;
  final String orderPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ViewOrderDetail(
                orderID: orderID,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Card(
              surfaceTintColor: Colors.white,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///! a logo
                        Row(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  // child: ,
                                ),
                                Positioned(
                                  top: -15,
                                  left: 10,
                                  child: CustomPaint(
                                    painter: CarrotShape(),
                                    size: const Size(30, 30),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              width: 25,
                            ),

                            ///! column -> id, farmername,farmer phone
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      orderID,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    CircleAvatar(
                                      radius: 3.5,
                                      backgroundColor: status == 'pending'
                                          ? Colors.yellow[400]
                                          : status == 'confirm by df cp'
                                              ? Colors.amber[200]
                                              : status ==
                                                      'processing by company'
                                                  ? Colors.blue[300]
                                                  : status ==
                                                          'ready to collect for distributor'
                                                      ? Colors.brown[300]
                                                      : 'ready to collect for me' ==
                                                              status
                                                          ? primaryColor
                                                          : Colors.green[800],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.man_3,
                                      size: 16,
                                    ),
                                    Text(
                                      farmerName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: primaryColor,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4),
                                      child: Text(
                                        farmerPhone,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              fontWeight: FontWeight.normal,
                                              color: primaryColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        ///! column -> money, companies, cats
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '৳ $orderPrice',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    letterSpacing: 0.1,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              farmerAddress,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.1,
                                  ),
                            ),
                            // Text(
                            //   category,
                            //   style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            //         color: primaryColor,
                            //         fontWeight: FontWeight.normal,
                            //         letterSpacing: 0.1,
                            //       ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                    if (status == 'ready to collect for me')

                      /// row of btns
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SecondayButtonGreen(
                            onpress: () async {
                              final loginState =
                                  context.read<LoginBloc>().state;

                              final deshiFarmerAPI = DeshiFarmerAPI();

                              ///! recevie api

                              if (loginState is LoginSuccess) {
                                ///! TODO: uncomment this
                                // final received =
                                //     await deshiFarmerAPI.receiveOrder(
                                //   loginState.successLoginEntity.token,
                                //   orderID,
                                // );
                                const received = null;
                                if (received == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      errorSnackBar('Order Received Error'),);
                                } else {
                                  context.read<OrderBloc>().add(InitOrders(
                                      loginState.successLoginEntity.token,),);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    successSnackBar(
                                      'Successfully Received Order',
                                    ),
                                  );
                                }
                              }
                            },
                            title: 'Receive',
                          ),
                          ErrorButtonGreen(
                            onpress: () async {
                              await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: const Text(
                                      'For report call the Deshifarmer Call Center +88019267432',
                                    ),
                                    title: const Text('Report'),
                                    // contentPadding: const EdgeInsets.all(8),
                                    // insetPadding: const EdgeInsets.all(8),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            title: 'Report',
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            if (status == 'collected by me')
              const Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  Icons.verified,
                  color: primaryColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
