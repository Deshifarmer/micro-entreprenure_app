import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/bloc/farmadd_form_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FarmCreationDate extends StatefulWidget {
  const FarmCreationDate({
    super.key,
  });

  @override
  State<FarmCreationDate> createState() => _FarmCreationDateState();
}

class _FarmCreationDateState extends State<FarmCreationDate> {
  DateTime? _dob = DateTime.now();
  //TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = context.read<FarmaddFormBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: state is FarmaddFormInitial ? state.farmStartingDate : null,
        onTap: () async {
          _dob = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1880),
            lastDate: DateTime.now(),
          );
          if (_dob != null) {
            if (state is FarmaddFormInitial) {
              state.farmStartingDate.text =
                  DateFormat('yyyy-MM-dd').format(_dob!);
            }
          }
        },
        keyboardType: TextInputType.none,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide.none,
          ),
          labelText: 'ফার্ম শুরু করার তারিখ',
          labelStyle: TextStyle(color: primaryColor),
          hintText: '2023-08-02',
          filled: true,
        ),
      ),
    );
  }
}
