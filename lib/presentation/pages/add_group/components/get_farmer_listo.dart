import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/add_group/add_group.dart';
import 'package:deshifarmer/presentation/pages/group_detail/bloc/group_detail_bloc.dart';
import 'package:deshifarmer/presentation/pages/group_detail/view/group_detail_page.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
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
                onTap: () async {
                  // print("group ID -> ${currentFarmer.farmer_group_id}");

                  final logINState = context.read<LoginBloc>().state;
                  if (logINState is LoginSuccess) {
                    context.read<GroupDetailBloc>().add(
                          GroupDetailFetchEvent(
                            groupID: currentFarmer.farmer_group_id,
                            token: logINState.successLoginEntity.token,
                          ),
                        );
                  }
                  Navigator.push(
                    context,
                    PageAnimationWrapper.sharedAxisTransitionPageWrapper(
                      const GroupDetailPage(),
                    ),
                  );
                },
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
