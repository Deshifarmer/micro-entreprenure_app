import 'package:animations/animations.dart';
import 'package:deshifarmer/data/datasources/remote/apis/order_api.dart';
import 'package:deshifarmer/domain/entities/orders_entity/order_response_entity.dart';
import 'package:deshifarmer/presentation/pages/attendance/attendance.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/components/accept_orderbutton.dart';
import 'package:deshifarmer/presentation/pages/order/components/unfullfilledorder_card.dart';
import 'package:deshifarmer/presentation/pages/order/pages/view_order_details.dart';
import 'package:deshifarmer/presentation/shapes/my_farmers_shape.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrderBody2 extends StatefulWidget {
  const OrderBody2({
    required this.token,
    super.key,
  });

  final String token;
  @override
  State<OrderBody2> createState() => _OrderBody2State();
}

class _OrderBody2State extends State<OrderBody2> {
  final PagingController<int, OrderEntity> _pagingController =
      PagingController(firstPageKey: 1);
  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);

    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await OrderAPI().userOrder2(
        widget.token,
      );

      final isLastPage = newItems.$1?.meta?.last_page == pageKey;
      if (isLastPage && newItems.$1?.data != null) {
        _pagingController.appendLastPage(newItems.$1?.data ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        if (newItems.$1?.data != null) {
          if (newItems.$1?.data != null) {
            _pagingController.appendPage(newItems.$1!.data, nextPageKey);
          }
        }
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginState = context.watch<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    return PagedListView(
      // separatorBuilder: (context, index) {
      //   return const Divider(
      //     color: Color(0xffa6a6a6),
      //   );
      // },
      padding: const EdgeInsets.all(10),
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<OrderEntity>(
        firstPageErrorIndicatorBuilder: (context) {
          return const Center(
            child: Text('Error'),
          );
        },
        
        itemBuilder: (context, item, index) {
          if (item.status == 'ready to collect for me') {
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
                                    '#${item.order_id}',
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
                                      color: item.status == 'pending'
                                          ? Colors.red
                                          : item.status == 'confirm by df cp'
                                              ? Colors.yellow
                                              : item.status ==
                                                      'processing by company'
                                                  ? Colors.blue
                                                  : item.status ==
                                                          'ready to collect for distributor'
                                                      ? Colors.orange
                                                      : item.status ==
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
                                '${item.farmer_details?.farmer_address}',
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
                                item.farmer_details?.farmer_name ?? '',
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
                                item.farmer_details?.farmer_phone ?? '',
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Spacer(),

                            /// two buttons one accept and another reject

                            AcceptOrderButton(
                              orderID: item.order_id ?? '',
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
                  orderID: item.order_id ?? '',
                );
              },
            );
          }
          return OpenContainer(
            closedBuilder: (context, action) {
              return UnfullfiledOrderListCard(
                singleOrder: item,
              );
            },
            closedColor: Colors.transparent,
            closedElevation: 0,
            openColor: Colors.transparent,
            middleColor: Colors.transparent,
            openElevation: 0,
            openBuilder: (context, action) {
              return ViewOrderDetail(
                orderID: item.order_id ?? '',
              );
            },
          );
        },
      ),
    );
  }
}
