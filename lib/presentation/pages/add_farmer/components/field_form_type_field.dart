import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

class FieldTypeFormField extends StatefulWidget {
  const FieldTypeFormField({
    super.key,
  });

  @override
  State<FieldTypeFormField> createState() => _FieldTypeFormFieldState();
}

class _FieldTypeFormFieldState extends State<FieldTypeFormField> {
  String _fieldType = '----------';
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
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.all(10),
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
        value: _fieldType,
        items: <String>['----------', 'Own (নিজস্ব)', 'Lease (লিজ)']
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
            addFarmerB.farmerLandTypeController.text = val.toString();
            setState(() {
              _fieldType = val ?? '----------';
            });
          }
        },
      ),
    );
  }
}
