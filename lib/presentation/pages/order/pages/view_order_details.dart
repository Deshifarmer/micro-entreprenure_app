import 'dart:convert';

import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/order/components/farmer_detail_pc.dart';
import 'package:deshifarmer/presentation/pages/order/components/order_detail_card_2.dart';
import 'package:deshifarmer/presentation/pages/order/components/order_detail_pc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ViewOrderDetail extends StatelessWidget {
  const ViewOrderDetail({
    required this.orderID,
    super.key,
  });
  final String orderID;

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        surfaceTintColor: backgroundColor2,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.navigate_before),
        ),
        backgroundColor: backgroundColor2,
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.all(
              20,
            ),
            height: getProportionateScreenHeight(150),
            decoration: const BoxDecoration(
              color: priceBoxColor,
            ),
            child: Row(
              children: [
                /// column of text
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'অর্ডারটি পাঠানো হচ্ছে',
                      // 'Order is on the way',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      // 'Your ordered products are on pickup point soon',
                      'আপনার অর্ডার করা পণ্য শীঘ্রই পিকআপ পয়েন্টে পৌঁছাবে',
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Image.asset(
                    'assets/logo/track.png',
                    height: 200,
                  ),
                ),

                /// track logo
              ],
            ),
          ),
          if (loginState is LoginSuccess)
            FutureBuilder(
              future: http.get(
                Uri.parse(
                  '${ApiDatabaseParams.orderApi}/$orderID',
                ),
                headers: {
                  ///! TODO: Do not forget to remove the token
                  'Authorization':
                      // 'Bearer ${loginState.successLoginEntity.token}',
                      'Bearer 55|9062I8GhTHqaQWFrfOu5HzcRG3df73axEgL5rBUK',
                },
              ),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  final data = snapshot.data;

                  final result =
                      jsonDecode(data.body.toString()) as List<dynamic>;
                  // print(DateFormat('yyyy-MM-dd').format());
                  // print(result.first['delivery_address']);
                  int getTotal() {
                    var a = 0;
                    for (final element in result) {
                      a = a + int.parse(element['quantity'].toString());
                    }
                    return a;
                  }
                  // sell_price

                  double getTotalPrice() {
                    var a = 0.0;
                    for (final element in result) {
                      a = a +
                          int.parse(element['quantity'].toString()) *
                              double.parse(
                                element['product_details']['sell_price']
                                    .toString(),
                              );
                    }
                    return a;
                  }

                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      /// delevary info
                      OrderdetailCard(
                        delevaryLocation:
                            result.first['delivery_address'].toString(),
                      ),

                      /// farmer detail
                      FarmerDetailCardForOrderDetail(
                        farmerName: result.first['farmer_name'].toString(),
                        farmerPhone:
                            result.first['delivery_contact'].toString(),
                        // farmerName: data['farmer_name'].toString(),
                        // farmerPhone: data['delivery_contact'].toString(),
                      ),

                      ///! DANGER AND MESSED UP ZONE
                      Container(
                        margin: EdgeInsets.symmetric(
                          //10
                          horizontal: getProportionateScreenWidth(10),
                          vertical: getProportionateScreenHeight(10),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(12),
                          vertical: getProportionateScreenHeight(12),
                          // 12
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            // delevary info
                            Row(
                              children: [
                                const Icon(
                                  Icons.business,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    result.first['product_details']['company']
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            for (final product in result)
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      getProportionateScreenWidth(10),
                                    ),
                                    child: Image.network(
                                      '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${product['product_details']['image']}',
                                      height: getProportionateScreenHeight(60),
                                      width: getProportionateScreenWidth(60),
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Center(
                                          child: Text(
                                            'Image Error',
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: Colors.redAccent,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      //8
                                      horizontal:
                                          getProportionateScreenWidth(8),
                                      vertical: getProportionateScreenHeight(8),
                                    ),
                                    child: Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product['product_details']['name']
                                              .toString(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          '৳ ${product['product_details']['sell_price']}',
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(8),
                                      vertical: getProportionateScreenHeight(8),
                                    ),
                                    child: Text(
                                      'QTY x ${product['quantity']}',
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(8),
                              ),
                              child: const Divider(
                                // height: 2,
                                color: Color(0xffa3a3a3),
                              ),
                            ),

                            const Text(
                              'অর্ডারের তথ্য',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'মোট (${getTotal()} টি)',
                                    // 'Subtotal (${getTotal()} items)',
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    '৳ ${getTotalPrice()}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'পরিবহন খরচ',
                                    // 'Shipping Free',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    '৳ 0',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'VAT',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    '৳ 0',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'সর্বমোট ',
                                    // 'Grand Total',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    '৳ ${getTotalPrice()}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      ///! DO NOT GO ABOVE

                      /// order detail
                      OrderDetailsProductCard(
                        orderID: result.first['me_order_id'].toString(),
                        orderStatus: result.first['status'].toString(),
                        // paymentMethod: result.first[''],
                        placedOn: result.first['created_at'].toString(),
                      ),
                    ],
                  );

                  /// show good things
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error Occured'),
                  );

                  /// show error shit
                }
                return Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: PrimaryLoadingIndicator(),
                );
              },
            ),
        ],
      ),
    );
  }
}
