import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/params/payment_params.dart';

class DropdownCubit extends Cubit<String> {
  DropdownCubit() : super(PaymentParams.paymentMethods.first);

  void changeDropdownValue(String val) => emit(val);
}
