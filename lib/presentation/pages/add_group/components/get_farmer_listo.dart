import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/add_group/add_group.dart';
import 'package:deshifarmer/presentation/pages/add_group/components/group_list_with_search.dart';
import 'package:flutter/cupertino.dart';
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
        }

        return GroupListsGrid(
          farmers: state.farmers,
        );
      },
    );
  }
}
