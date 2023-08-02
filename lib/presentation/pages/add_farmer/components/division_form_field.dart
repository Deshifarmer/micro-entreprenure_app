import 'package:deshifarmer/data/datasources/local/location_db/dist_db.dart';
import 'package:deshifarmer/data/models/location_model.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

import '../bloc/add_farmer_bloc.dart';

class DivisionFormField extends StatelessWidget {
  const DivisionFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<AddFarmerBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<DistModel>(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        isExpanded: true,
        decoration: const InputDecoration(
          label: Text('জেলা নির্বাচন করুন'),
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
        value: distDatabase.first,
        items: distDatabase.map<DropdownMenuItem<DistModel>>((DistModel value) {
          return DropdownMenuItem<DistModel>(
            // alignment: Alignment.center,
            value: value,
            child: Text(value.bnName),
          );
        }).toList(),
        onChanged: (DistModel? val) {

          if (val != null && state is AddFarmerInitial) {
            state.farmerDistController.text = val.id;
          }
          // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
        },
      ),
    );
  }
}
