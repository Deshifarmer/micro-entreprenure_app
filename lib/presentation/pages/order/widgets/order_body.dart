import 'package:animations/animations.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/orders_entity/order_response_entity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/order/pages/view_order_details.dart';
import 'package:deshifarmer/presentation/shapes/carrot_shape.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// {@template order_body}
/// Body of the OrderPage.
///
/// Add what it does
/// {@endtemplate}
class OrderBody extends StatelessWidget {
  /// {@macro order_body}
  const OrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderSuccess) {
          final loginState = context.watch<LoginBloc>().state;
          final token = loginState is LoginSuccess
              ? loginState.successLoginEntity.token
              : '';
          final allOrders = state.orderEntitys.orders;

          /// all the orders where status is "ready to collect for me"
          final readyToCollectForMe = allOrders
              .where((element) => element.status == 'ready to collect for me')
              .toList();
          final otherStatus = allOrders
              .where((element) => element.status != 'ready to collect for me')
              .toList();
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                /// ready to collect for me
                if (readyToCollectForMe.isNotEmpty) ...[
                  const Text('অর্ডার সংগ্রহ করুন '),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: readyToCollectForMe.length > 20
                        ? 20
                        : readyToCollectForMe.length,
                    itemBuilder: (c, i) {
                      final singleOrder = readyToCollectForMe.elementAt(i);
                      return OpenContainer(
                        closedBuilder: (context, action) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// order id, dot sign and farmer address in Row
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                              padding: EdgeInsets.only(left: 5),
                                              child: Icon(
                                                Icons.circle,
                                                size: 10,
                                                color: singleOrder.status ==
                                                        'pending'
                                                    ? Colors.red
                                                    : singleOrder.status ==
                                                            'confirm by df cp'
                                                        ? Colors.yellow
                                                        : singleOrder.status ==
                                                                'processing by company'
                                                            ? Colors.blue
                                                            : singleOrder
                                                                        .status ==
                                                                    'ready to collect for distributor'
                                                                ? Colors.orange
                                                                : singleOrder
                                                                            .status ==
                                                                        'ready to collect for me'
                                                                    ? Color(
                                                                        0xfff1e826)
                                                                    : Colors
                                                                        .green,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                            '${singleOrder.farmer_details?.farmer_address}'),
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: CustomPaint(
                                            painter: MyFarmersShape(),
                                            size: const Size(15, 15),
                                          ),
                                        ),
                                        Text(singleOrder
                                                .farmer_details?.farmer_name ??
                                            ''),
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
                                        Text(singleOrder
                                                .farmer_details?.farmer_phone ??
                                            ''),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Spacer(),

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
                  ),
                  Divider(
                    color: Color(0xffa6a6a6),
                  ),
                ],

                /// other status orders
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: otherStatus.length > 20 ? 20 : otherStatus.length,
                  itemBuilder: (c, i) {
                    final singleOrder = otherStatus.elementAt(i);
                    return OpenContainer(
                      closedBuilder: (context, action) {
                        return UnfullfiledOrderListCard(
                            singleOrder: singleOrder);
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
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Center(
                  child: Text(
                    '''আমরা শেষ 20টি অর্ডার দেখাচ্ছি। আপনি যদি সমস্ত অর্ডার অ্যাক্সেস করতে চান আমাদের সাথে যোগাযোগ করুন''',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }
        if (state is OrderFetchFailed) {
          return Column(
            children: [
              LottieBuilder.asset('assets/animations/failed.json'),
              // const Text('কোন অর্ডার নেই'),
              /// failed to fetch order message in Bangla
              Text(
                'অর্ডার তালিকা পাওয়া যায়নি',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          );
        }
        return const Center(child: Text('order page'));
      },
    );
  }
}

class AcceptOrderButton extends StatefulWidget {
  const AcceptOrderButton({
    required this.orderID,
    required this.token,
    super.key,
  });

  final String orderID;
  final String token;

  @override
  State<AcceptOrderButton> createState() => _AcceptOrderButtonState();
}

class _AcceptOrderButtonState extends State<AcceptOrderButton> {
  bool isLoading = false;
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (isLoading) {
          return;
        }
        setState(() {
          isLoading = true;
        });
        DeshiFarmerAPI dfAPI = DeshiFarmerAPI();
        final isSuccess =
            await dfAPI.collectOrder(widget.orderID, widget.token);
        if (isSuccess) {
          // show a snackbar with success message
          ScaffoldMessenger.of(context).showSnackBar(
              // const SnackBar(
              //   content: Text('অর্ডার গ্রহণ করা হয়েছে'),
              // ),
              successSnackBar('অর্ডার গ্রহণ করা হয়েছে'));
          setState(() {
            isAccepted = true;
          });
        } else {
          // show a snackbar with failed message
          ScaffoldMessenger.of(context).showSnackBar(
              // const SnackBar(
              //   content: Text('অর্ডার গ্রহণ করা হয়নি'),
              // ),
              errorSnackBar('অর্ডার গ্রহণ করা হয়নি'));
          setState(() {
            isAccepted = false;
          });
        }
      },
      child: isLoading
          ? PrimaryLoadingIndicator()
          : Text(
              'অর্ডার গ্রহণ করুন',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class UnfullfiledOrderListCard extends StatelessWidget {
  const UnfullfiledOrderListCard({
    super.key,
    required this.singleOrder,
  });

  final OrderEntity singleOrder;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      padding: const EdgeInsets.all(10),
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
                                padding: EdgeInsets.only(left: 5),
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
                                                      ? Color(0xfff1e826)
                                                      : Colors.green,
                                ),
                              ),
                            ],
                          ),

                          /// farmer name and phone
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: CustomPaint(
                                  painter: MyFarmersShape(),
                                  size: const Size(15, 15),
                                ),
                              ),
                              Text(
                                singleOrder.farmer_details?.farmer_name ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
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
                                singleOrder.farmer_details?.farmer_phone ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
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
                    size: Size(30, 30),
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
    );
  }
}

class CardElementTile extends StatelessWidget {
  const CardElementTile({
    required this.title,
    required this.value,
    super.key,
  });

  final String? title;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title ?? ''),
          Text(value ?? ''),
        ],
      ),
    );
  }
}
