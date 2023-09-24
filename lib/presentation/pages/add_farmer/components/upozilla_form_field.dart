import 'package:deshifarmer/data/datasources/local/location_db/upozilla_db.dart';
import 'package:deshifarmer/data/models/location_model.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

class UpzillaFormField extends StatelessWidget {
  const UpzillaFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<AddFarmerBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<UpozillaModel>(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        isExpanded: true,
        decoration: const InputDecoration(
          label: Text('উপজেলা নির্বাচন করুন'),
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
        value: upzillaDatabase.first,
        items: upzillaDatabase
            .map<DropdownMenuItem<UpozillaModel>>((UpozillaModel value) {
          return DropdownMenuItem<UpozillaModel>(
            // alignment: Alignment.center,
            value: value,
            child: Text(value.bnName),
          );
        }).toList(),
        onChanged: (UpozillaModel? val) {
          // context.read<DropdownCubit>().changeDropdownValue(val ?? '');

          if (val != null && state is AddFarmerInitial) {
            state.farmerUpozillaController.text = val.id;
          }
        },
      ),
    );
  }
}
