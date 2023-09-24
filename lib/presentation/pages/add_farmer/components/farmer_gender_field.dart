import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

class GenderField extends StatelessWidget {
  const GenderField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<AddFarmerBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<String>(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        isExpanded: true,
        // underline: Container(),
        decoration: const InputDecoration(
          label: Text('কৃষকটি ছেলে / মেয়ে ?'),
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.all(10),
          // fillColor: Colors.greenAccent,
          // contentPadding: EdgeInsets.all(10),
        ),
        // decoration: ShapeDecoration(),

        elevation: 16,
        value: 'Male',
        items: <String>['Male', 'Female', 'Other']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            // alignment: Alignment.center,
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? val) {
          if (state is AddFarmerInitial && val != null) {
            state.farmerGenderController.text = val;
          }
          // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
        },
      ),
    );
  }
}

class MaritalStatusField extends StatelessWidget {
  const MaritalStatusField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.read<AddFarmerBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<String>(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        isExpanded: true,
        // underline: Container(),
        decoration: const InputDecoration(
          label: Text('বৈবাহিক অবস্থা'),
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
        value: 'Married',
        items: <String>[
          'Married',
          'Unmarried',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            // alignment: Alignment.center,
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? val) {
          if (state is AddFarmerInitial && val != null) {
            state.farmerRelationalStatusController.text = val;
          }
          // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
        },
      ),
    );
  }
}
