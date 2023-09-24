import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

class FamilyMemberFormField extends StatefulWidget {
  const FamilyMemberFormField({
    super.key,
  });

  @override
  State<FamilyMemberFormField> createState() => _FamilyMemberFormFieldState();
}

class _FamilyMemberFormFieldState extends State<FamilyMemberFormField> {
  int _familyMembers = 0;
  @override
  Widget build(BuildContext context) {
    final addFarmerB = context.read<AddFarmerBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: DropdownButtonFormField<int>(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        isExpanded: true,
        decoration: const InputDecoration(
          label: Text('কৃষকের পরিবারের সদস্য সংখ্যা'),
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
            borderSide: BorderSide.none,
          ),
          filled: true,
          // fillColor: Colors.greenAccent,
          // contentPadding: EdgeInsets.all(10),
        ),
        // decoration: ShapeDecoration(),

        elevation: 16,
        value: _familyMembers,
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
            addFarmerB.farmerFamilyMembersController.text = val.toString();
            setState(() {
              _familyMembers = val ?? 0;
            });
          }
        },
      ),
    );
  }
}
