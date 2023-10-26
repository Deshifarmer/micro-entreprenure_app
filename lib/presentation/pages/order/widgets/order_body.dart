import 'package:animations/animations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deshifarmer/data/datasources/local/shared_prefs/local_database_sf.dart';
import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/view/login_page.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/order/components/last_stage_orderlist.dart';
import 'package:deshifarmer/presentation/pages/order/components/unfullfilledorder_card.dart';
import 'package:deshifarmer/presentation/pages/order/pages/view_order_details.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
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
                  Text(
                    'অর্ডার সংগ্রহ করুন ',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: primaryColor),
                  ),
                  LastStageOrderList(
                    readyToCollectForMe: readyToCollectForMe,
                    token: token,
                  ),
                  const Divider(
                    color: Color(0xffa6a6a6),
                  ),
                ],
                if (otherStatus.isNotEmpty) ...[
                  Text(
                    'সাম্প্রতিক অর্ডার',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: primaryColor),
                  ),

                  /// other status orders
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        otherStatus.length > 20 ? 20 : otherStatus.length,
                    itemBuilder: (c, i) {
                      final singleOrder = otherStatus.elementAt(i);
                      return OpenContainer(
                        closedBuilder: (context, action) {
                          return UnfullfiledOrderListCard(
                            singleOrder: singleOrder,
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
                ],
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                if (otherStatus.isNotEmpty)
                  const Center(
                    child: Text(
                      '''আমরা শেষ 20টি অর্ডার দেখাচ্ছি। আপনি যদি সমস্ত অর্ডার অ্যাক্সেস করতে চান আমাদের সাথে যোগাযোগ করুন''',
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (otherStatus.isEmpty)
                  const Center(
                    child: Text(
                      '''অর্ডার তালিকা পাওয়া যায়নি''',
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
              ],
            ),
          );
        }
        if (state is OrderFetchFailed) {
          if (state.message.contains('401') &&
              state.message.contains('Unauthenticated.')) {
            SharedPrefDBServices().removeLoginToken();
            // send the user to login page
            Navigator.of(context).popUntil((route) => route.isFirst);
            context.read<LoginBloc>().add(const ResetLoginEvent());
          }

          return Column(
            children: [
              LottieBuilder.asset('assets/animations/failed.json'),
              // const Text('কোন অর্ডার নেই'),
              /// failed to fetch order message in Bangla
              Text(
                state.message,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          );
        }
        return const Center(child: PrimaryLoadingIndicator());
      },
    );
  }
}
