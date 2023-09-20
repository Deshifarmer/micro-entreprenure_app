import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_order_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/shapes/carrot_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/error_button.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class FarmerOrderCard extends StatelessWidget {
  const FarmerOrderCard({
    required this.currentOrder,
    super.key,
  });

  final FarmerOrderEntity currentOrder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          surfaceTintColor: Colors.white,
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              // 10,
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(10),
            ),
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
                              height: getProportionateScreenHeight(
                                25,
                              ),
                              width: getProportionateScreenWidth(
                                25,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(
                                  6,
                                ),
                              ),
                              // child: ,
                            ),

                            /// carrot shape
                            Positioned(
                              top: -15,
                              left: 10,
                              child: CustomPaint(
                                painter: CarrotShape(),
                                size: Size(
                                  getProportionateScreenWidth(
                                    30,
                                  ),
                                  getProportionateScreenHeight(
                                    30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          width: getProportionateScreenWidth(
                            25,
                          ),
                        ),

                        ///! column -> id, farmername,farmer phone
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '#${currentOrder.order_id}',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(
                                    5,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 3.5,
                                  backgroundColor: currentOrder.status ==
                                          'pending'
                                      ? Colors.yellow[400]
                                      : currentOrder.status ==
                                              'confirm by df cp'
                                          ? Colors.amber[200]
                                          : currentOrder.status ==
                                                  'processing by company'
                                              ? Colors.blue[300]
                                              : currentOrder.status ==
                                                      'ready to collect for distributor'
                                                  ? Colors.brown[300]
                                                  : 'ready to collect for me' ==
                                                          currentOrder.status
                                                      ? primaryColor
                                                      : Colors.green[800],
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '৳ ${currentOrder.total_price}',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    // letterSpacing: 0.1,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),

                        ///! TODO: uncomment this
                        // Text(
                        //   currentOrder.farmer_details?.farmer_address ?? '',
                        //   style:
                        //       Theme.of(context).textTheme.labelSmall!.copyWith(
                        //             color: primaryColor,
                        //             fontWeight: FontWeight.normal,
                        //             // letterSpacing: 0.1,
                        //           ),
                        // ),
                      ],
                    ),
                  ],
                ),
                if (currentOrder.status == 'ready to collect for me')

                  /// row of btns
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SecondayButtonGreen(
                        onpress: () async {
                          final loginState = context.read<LoginBloc>().state;

                          final deshiFarmerAPI = DeshiFarmerAPI();

                          ///! recevie api

                          if (loginState is LoginSuccess) {
                            ///! TODO: uncomment this
                            // final received = await deshiFarmerAPI.receiveOrder(
                            //   loginState.successLoginEntity.token,
                            //   currentOrder.order_id ?? '',
                            // );
                            // if (received == null) {
                            //   ScaffoldMessenger.of(
                            //     context,
                            //   ).showSnackBar(
                            //     errorSnackBar(
                            //       'Order Received Error',
                            //     ),
                            //   );
                            // } else {
                            //   context.read<OrderBloc>().add(
                            //         InitOrders(
                            //           loginState.successLoginEntity.token,
                            //         ),
                            //       );
                            //   ScaffoldMessenger.of(
                            //     context,
                            //   ).showSnackBar(
                            //     successSnackBar(
                            //       'Successfully Received Order',
                            //     ),
                            //   );
                            // }
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
                                    onPressed: () => Navigator.pop(
                                      context,
                                    ),
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
        if (currentOrder.status == 'collected by me')
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
