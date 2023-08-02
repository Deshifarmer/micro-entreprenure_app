import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

import '../bloc/add_farmer_bloc.dart';

class FieldTypeFormField extends StatelessWidget {
  const FieldTypeFormField({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final addFarmerB = context.read<AddFarmerBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<String>(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        isExpanded: true,
        decoration: const InputDecoration(
          label: Text('জমির ধরণ নির্বাচন করুন'),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 2),
          ),
          filled: true,
          // fillColor: Colors.greenAccent,
          // contentPadding: EdgeInsets.all(10),
        ),
        // decoration: ShapeDecoration(),

        elevation: 16,
        value: 'Own (নিজস্ব)',
        items: <String>['Own (নিজস্ব)', 'Lease (লিজ)']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            // alignment: Alignment.center,
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? val) {
          // context.read<DropdownCubit>().changeDropdownValue(val ?? '');

          if (addFarmerB is AddFarmerInitial) {
            addFarmerB.farmerChildrenController.text = val.toString();
          }
        },
      ),
    );
  }
}
