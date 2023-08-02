import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FarmarDOB extends StatefulWidget {
  const FarmarDOB({
    super.key,
  });

  @override
  State<FarmarDOB> createState() => _FarmarDOBState();
}

class _FarmarDOBState extends State<FarmarDOB> {
  DateTime? _dob = DateTime.now();
  //TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = context.read<AddFarmerBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: state is AddFarmerInitial ? state.dobController : null,
        onTap: () async {
          _dob = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1880),
            lastDate: DateTime.now(),
          );
          if (_dob != null) {
            if (state is AddFarmerInitial) {
              state.dobController.text = DateFormat('yyyy-MM-dd').format(_dob!);
            }
          }
        },
        keyboardType: TextInputType.none,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          labelText: 'কৃষকের জন্ম তারিখ',
          hintText: '',
          filled: true,
        ),
      ),
    );
  }
}
