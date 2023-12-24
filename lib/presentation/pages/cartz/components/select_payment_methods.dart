import 'package:deshifarmer/core/params/payment_params.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/services/cubit/dropdown/dropdown_cubit.dart';
import 'package:flutter/material.dart';

class SelectPaymentMethods extends StatelessWidget {
  const SelectPaymentMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DropdownForPaymentCubit, String>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('আপনি কিভাৱে পেমেন্ট করবেন ?'),
              for (final String method in PaymentParams.paymentMethods)
                RadioListTile<String>.adaptive(
                  value: method,
                  activeColor: priceBoxColor,
                  groupValue: state,
                  title: Text(
                    method,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  onChanged: (x) {
                    context
                        .read<DropdownForPaymentCubit>()
                        .changeDropdownValue(x ?? '');
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
