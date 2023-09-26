import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/group_field_entity.dart';
import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class SelectGroupExpansionTile extends StatelessWidget {
  const SelectGroupExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      
      // initiallyExpanded: true,
      onExpansionChanged: (value) {
        final loginState = context.read<LoginBloc>().state;
        final token = loginState is LoginSuccess
            ? loginState.successLoginEntity.token
            : '';

        if (value) {
          // GetGroupCubit
          context.read<GetGroupCubit>().addAllGroupFields(token);
        }
        // print('value -> isOpen $value');
      },
      // ignore: lines_longer_than_80_chars
      title: const Text(
        'গ্রুপে যোগ করতে চাইলে এইখানে ক্লিক করুন এবং গ্রুপ সিলেক্ট করুন',
      ),
      children: const [
        GroupSelector(),
      ],
    );
  }
}

class GroupSelector extends StatefulWidget {
  const GroupSelector({
    super.key,
  });

  @override
  State<GroupSelector> createState() => _GroupSelectorState();
}

class _GroupSelectorState extends State<GroupSelector> {
  /// a var where we will store the selected value
  List<GroupFieldEntity> _groups = [];
  GroupFieldEntity? _selectedGroup;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetGroupCubit, AllFarmerGroupFieldResp>(
      listener: (context, state) {
        // print('current stae -> $state');
        setState(
          () {
            _groups = state.farmers;
            _selectedGroup = state.farmers.first;
          },
        );
      },
      builder: (context, state) {
        if (state.farmers.isEmpty) {
          return const Text('No Group Found');
        }

        final addFarmerB = context.read<AddFarmerBloc>().state;
        return Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButtonFormField<GroupFieldEntity>(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            isExpanded: _selectedGroup != null ? false : true,
            decoration: const InputDecoration(
              label: Text('গ্রুপ সিলেক্ট করুন'),
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
            value: _selectedGroup,
            items: _groups.map<DropdownMenuItem<GroupFieldEntity>>(
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
                setState(() {
                  _selectedGroup = val;
                });
              }
              // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
            },
          ),
        );
      },
    );
  }
}
