import 'package:deshifarmer/data/datasources/local/location_db/division_db.dart';
import 'package:deshifarmer/data/models/location_model.dart';
import 'package:flutter/material.dart';

class DistFormField extends StatelessWidget {
  const DistFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<DivisionModel>(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        isExpanded: true,
        decoration: const InputDecoration(
          label: Text('বিভাগ নির্বাচন করুন'),
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
        value: divisionDatabase.first,
        items: divisionDatabase
            .map<DropdownMenuItem<DivisionModel>>((DivisionModel value) {
          return DropdownMenuItem<DivisionModel>(
            // alignment: Alignment.center,
            value: value,
            child: Text(value.bnName),
          );
        }).toList(),
        onChanged: (DivisionModel? val) {
          // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
        },
      ),
    );
  }
}

