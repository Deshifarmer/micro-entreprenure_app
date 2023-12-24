import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

class MBankAccountType extends StatelessWidget {
  const MBankAccountType({
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
          label: Text('কীসের একাউন্ট?'),
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
        value: 'বিকাশ',
        items: <String>[
          'বিকাশ',
          'নগদ',
          'উপায়',
          'রকেট',
          'অন্যান্য',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            // alignment: Alignment.center,
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? val) {
          if (addFarmerB is AddFarmerInitial) {
            addFarmerB.farmerMFSAccountTypeController.text = val.toString();
            if ('বিকাশ' == val) {
              debugPrint('bkash pressed');
              addFarmerB.farmerMFSAccountTypeController.text = 'bkash';
            } else if ('নগদ' == val) {
              debugPrint('nagad pressed');
              addFarmerB.farmerMFSAccountTypeController.text = 'nogod';
            } else if ('উপায়' == val) {
              debugPrint('upay pressed');
              addFarmerB.farmerMFSAccountTypeController.text = 'upay';
            } else if ('রকেট' == val) {
              debugPrint('roket pressed');
              addFarmerB.farmerMFSAccountTypeController.text = 'rocket';
            } else if ('অন্যান্য' == val) {
              debugPrint('other pressed');
              addFarmerB.farmerMFSAccountTypeController.text = 'other';
            }
          }
        },
      ),
    );
  }
}
