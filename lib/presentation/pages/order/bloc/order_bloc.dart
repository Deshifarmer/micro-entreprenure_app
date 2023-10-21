import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/repositories/order_repo_impl.dart';
import 'package:deshifarmer/domain/entities/orders_entity/all_orders.dart';
import 'package:equatable/equatable.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderInitial()) {
    on<InitOrders>(_onCustomOrderEvent);
  }
  UserOrderRepoImpl usrOrder = UserOrderRepoImpl();
  FutureOr<void> _onCustomOrderEvent(
    InitOrders event,
    Emitter<OrderState> emit,
  ) async {
    final userOrderResponse = await usrOrder.userOrder(event.token);
    final value = switch (userOrderResponse) {
      Success(data: final succ) => succ,
      ServerFailor(error: final err) => err,
    };
    if (value is AllOrdersEntity) {
      emit(OrderSuccess(value));
    } else {
      emit(OrderFetchFailed(
        message: value.toString(),
      ),);
    }
  }
}
