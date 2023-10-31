import 'package:animations/animations.dart';
import 'package:deshifarmer/domain/entities/orders_entity/order_response_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/components/order_card_for_home.dart';
import 'package:deshifarmer/presentation/pages/order/pages/view_order_details.dart';
import 'package:flutter/material.dart';

class HomePageOrders extends StatelessWidget {
  const HomePageOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (_, int index) {
          final orderStatus = context.read<OrderBloc>().state;
          final recentOrders = orderStatus is OrderSuccess
              ? orderStatus.orderEntitys.data.length > 3
                  ? orderStatus.orderEntitys.data.sublist(0, 3)
                  : orderStatus.orderEntitys.data
              : <OrderEntity>[];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (recentOrders.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 30,
                    right: 30,
                  ),
                  child: Text(
                    'সাম্প্রতিক অর্ডার',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: const Color(0xff4C6E5E),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              if (recentOrders.isNotEmpty)
                for (final order in recentOrders)
                  OpenContainer(
                    closedBuilder: (context, action) {
                      return OrderCardForHome(
                        singleOrder: order,
                      );
                    },
                    closedColor: Colors.transparent,
                    closedElevation: 0,
                    openColor: Colors.transparent,
                    middleColor: Colors.transparent,
                    openElevation: 0,
                    openBuilder: (context, action) {
                      final singleOrder = order;
                      return ViewOrderDetail(
                        orderID: singleOrder.order_id ?? '',
                      );
                    },
                  ),
            ],
          );
        },
        childCount: 1,
      ),
    );
  }
}
