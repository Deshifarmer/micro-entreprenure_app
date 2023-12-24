import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/group_field_entity.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class SelectGroupExpansionTile extends StatelessWidget {
  const SelectGroupExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    return FutureBuilder<AllFarmerGroupFieldResp?>(
      future: DeshiFarmerAPI().getGroupFields2(token),
      builder: (context, AsyncSnapshot<AllFarmerGroupFieldResp?> snapshot) {
        return ExpansionTile(
          // initiallyExpanded: true,
          onExpansionChanged: (value) {
            
          },
          // ignore: lines_longer_than_80_chars
          title: const Text(
            'গ্রুপে যোগ করতে চাইলে এইখানে ক্লিক করুন এবং গ্রুপ সিলেক্ট করুন',
          ),
          children: [
            if (snapshot.hasData &&
                ConnectionState.done == snapshot.connectionState)
              GroupSelector(
                groups: snapshot.data?.farmers ?? [],
              )
            else
              const Text('কোনো গ্রুপ পাওয়া যায় নি'),
          ],
        );
      },
    );
  }
}

class GroupSelector extends StatelessWidget {
  const GroupSelector({
    required List<GroupFieldEntity> groups,
    super.key,
  }) : _groups = groups;

  /// a var where we will store the selected value
  final List<GroupFieldEntity> _groups;
  @override
  Widget build(BuildContext context) {
    if (_groups.isEmpty) {
      return const Text('কোনো গ্রুপ পাওয়া যায় নি');
    } else {
      final addFarmerB = context.read<AddFarmerBloc>().state;
      return Padding(
        padding: const EdgeInsets.all(8),
        child: DropdownButtonFormField<GroupFieldEntity>(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          // isExpanded: _selectedGroup != null ? false : true,
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
          hint: const Text('গ্রুপ সিলেক্ট করুন'),
          // value: _selectedGroup,
          items: _groups.map<DropdownMenuItem<GroupFieldEntity>>(
            (GroupFieldEntity value) {
              return DropdownMenuItem<GroupFieldEntity>(
                value: value,
                child: Text(value.farmer_group_name),
              );
            },
          ).toList(),
          onChanged: (GroupFieldEntity? val) {
            if (addFarmerB is AddFarmerInitial &&
                val != null &&
                val.farmer_group_id != 'x') {
              addFarmerB.farmerGroupIDController.text = val.farmer_group_id;
              // setState(() {
              //   _selectedGroup = val;
              // });
            }
            // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
          },
        ),
      );
    }
  }
}
