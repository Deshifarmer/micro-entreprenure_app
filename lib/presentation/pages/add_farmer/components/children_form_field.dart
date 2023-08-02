import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

class ChildrenFormField extends StatelessWidget {
  const ChildrenFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addFarmerB = context.read<AddFarmerBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<int>(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        isExpanded: true,
        decoration: const InputDecoration(
          label: Text('সন্তান সংখ্যা'),
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
        value: 0,
        items: List.generate(10, (index) => index)
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            // alignment: Alignment.center,
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
        onChanged: (int? val) {
          if (addFarmerB is AddFarmerInitial) {
            addFarmerB.farmerChildrenController.text = val.toString();
          }

          // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
        },
      ),
    );
  }
}
