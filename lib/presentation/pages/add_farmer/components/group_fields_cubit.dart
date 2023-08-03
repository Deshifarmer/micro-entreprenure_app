import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/group_field_entity.dart';
import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

class GroupSelector extends StatelessWidget {
  const GroupSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetGroupCubit, AllFarmerGroupFieldResp>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.farmers.isEmpty) {
          return const Text('No Group Found');
          //return const SizedBox.shrink();
        }

        final addFarmerB = context.read<AddFarmerBloc>().state;
        return Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButtonFormField<GroupFieldEntity>(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            isExpanded: true,
            decoration: const InputDecoration(
              label: Text('গ্রুপ সিলেক্ট করুন'),
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
            value: state.farmers.first,
            items: state.farmers.map<DropdownMenuItem<GroupFieldEntity>>(
                (GroupFieldEntity value) {
              return DropdownMenuItem<GroupFieldEntity>(
                // alignment: Alignment.center,
                value: value,
                child: Text(value.farmer_group_name),
              );
            }).toList(),
            onChanged: (GroupFieldEntity? val) {
              if (addFarmerB is AddFarmerInitial && val != null) {
                addFarmerB.farmerGroupIDController.text = val.farmer_group_id;
              }
              // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
            },
          ),
        );
      },
    );
  }
}
