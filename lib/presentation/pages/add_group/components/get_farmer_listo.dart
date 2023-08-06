import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:flutter/material.dart';

class GetFarmerListo extends StatelessWidget {
  const GetFarmerListo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetGroupCubit, AllFarmerGroupFieldResp>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.farmers.isEmpty) {
          return const SizedBox.shrink();
          //return const SizedBox.shrink();
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.farmers.length,
          itemBuilder: (context, index) {
            final currentFarmer = state.farmers.elementAt(index);
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(currentFarmer.farmer_group_name),
                trailing: CircleAvatar(
                  backgroundColor: Colors.green[800],
                  child: Text(currentFarmer.total_farmers.toString()),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
