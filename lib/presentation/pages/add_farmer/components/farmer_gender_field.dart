import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

class GenderField extends StatefulWidget {
  const GenderField({
    super.key,
  });

  @override
  State<GenderField> createState() => _GenderFieldState();
}

class _GenderFieldState extends State<GenderField> {
  String _gender = '----------';
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
        value: _gender,
        items: <String>[
          '----------',
          'Male',
          'Female',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            // alignment: Alignment.center,
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? val) {
          if (state is AddFarmerInitial && val != null) {
            state.farmerGenderController.text = val;
            setState(() {
              _gender = val;
            });
          }
          // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
        },
      ),
    );
  }
}

class MaritalStatusField extends StatefulWidget {
  const MaritalStatusField({
    super.key,
  });

  @override
  State<MaritalStatusField> createState() => _MaritalStatusFieldState();
}

class _MaritalStatusFieldState extends State<MaritalStatusField> {
  String _maritalStatus = '----------';
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
        value: _maritalStatus,
        items: <String>[
          '----------',
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
          setState(() {
            _maritalStatus = val ?? '----------';
          });
          // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
        },
      ),
    );
  }
}
