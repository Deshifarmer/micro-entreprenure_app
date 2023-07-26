import 'package:deshifarmer/presentation/pages/order/bloc/bloc.dart';
import 'package:flutter/material.dart';

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
          final allOrders = state.orderEntitys.orders;
          return ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'অর্ডার সমূহ',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.green[600],
                      ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allOrders.length,
                itemBuilder: (c, i) {
                  final singleOrder = allOrders.elementAt(i);
                  return Card(
                    child: Column(
                      children: [
                        // order id, status
                        CardElementTile(
                          title: singleOrder.order_id,
                          value: singleOrder.status,
                        ),
                        // farmer name
                        CardElementTile(
                          title: 'কৃষক নাম',
                          value: singleOrder.farmerDetail?.farmer_name ?? '',
                        ),
                        // farmer phone
                        CardElementTile(
                          title: 'কৃষক ফোন নাম্বার',
                          value: singleOrder.farmerDetail?.farmer_phone ?? '',
                        ),
                        // amount, commision
                        CardElementTile(
                          title: 'মোট ${singleOrder.total_price}  টাকা',
                          value: 'কমিশন ${singleOrder.me_commission} টাকা',
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        }
        if (state is OrderFetchFailed) {
          return const Center(child: Text('Failed fetching..........'));
        }
        return const Center(child: Text('order page'));
      },
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
