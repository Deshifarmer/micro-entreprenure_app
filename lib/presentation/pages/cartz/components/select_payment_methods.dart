import 'package:deshifarmer/core/params/payment_params.dart';
import 'package:deshifarmer/presentation/cubit/dropdown/dropdown_cubit.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:flutter/material.dart';

class SelectPaymentMethods extends StatelessWidget {
  const SelectPaymentMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DropdownCubit, String>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButtonFormField<String>(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            isExpanded: true,
            // underline: Container(),
            decoration: const InputDecoration(
              // hintText: 'পেমেন্ট পদ্ধতি নির্বাচন করুন',
              label: Text('পেমেন্ট পদ্ধতি নির্বাচন করুন'),
              enabledBorder: OutlineInputBorder(
                //<-- SEE HERE
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                //<-- SEE HERE
                borderSide: BorderSide(width: 2),
              ),
              filled: true,
              // fillColor: Colors.greenAccent,
              // contentPadding: EdgeInsets.all(10),
            ),
            // decoration: ShapeDecoration(),

            elevation: 16,
            value: state,
            items: PaymentParams.paymentMethods
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                // alignment: Alignment.center,
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? val) {
              context.read<DropdownCubit>().changeDropdownValue(val ?? '');
            },
          ),
        );
      },
    );
  }
}
