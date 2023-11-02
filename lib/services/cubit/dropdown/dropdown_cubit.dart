import 'package:bloc/bloc.dart';
import 'package:deshifarmer/core/params/payment_params.dart';
// import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';

class DropdownForPaymentCubit extends Cubit<String> {
  DropdownForPaymentCubit() : super(PaymentParams.paymentMethods.first);

  void changeDropdownValue(String val) => emit(val);
}

// class DropdownForFarmerCubit extends Cubit<FarmerEntity?> {
//   DropdownForFarmerCubit() : super(null);

//   void changeDropdownValue(FarmerEntity val) => emit(val);
// }
