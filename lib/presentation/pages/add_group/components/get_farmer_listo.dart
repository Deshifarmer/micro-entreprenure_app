import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/add_group/add_group.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

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

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.farmers.length,
          itemBuilder: (context, index) {
            final currentFarmer = state.farmers.elementAt(index);
            return Card(
              color: getRandomColor().withOpacity(0.4),
              margin: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // group name
                    Text(
                      currentFarmer.farmer_group_name,
                      style: Theme.of(context).textTheme.headlineMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),

                    FlutterImageStack.widgets(
                      itemRadius: 40,
                      totalCount: currentFarmer.total_farmers,
                      itemBorderWidth: 0,
                      children: [
                        for (final img in currentFarmer.member_pic)
                          CircleAvatar(
                            backgroundColor: primaryColor2,
                            foregroundImage: NetworkImage(
                              checkDomain(
                                Strings.getServerOrLocal(
                                  ServerOrLocal.server,
                                ),
                              )
                                  ? dummyImage
                                  : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${img}',
                            ),
                          ),
                      ],
                    ),
                    // total farmers
                    Text(
                      '${currentFarmer.total_farmers} জন কৃষক',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              // child: ListTile(
              //   onTap: () async {
              //     // print("group ID -> ${currentFarmer.farmer_group_id}");

              //     final logINState = context.read<LoginBloc>().state;
              //     if (logINState is LoginSuccess) {
              //       context.read<GroupDetailBloc>().add(
              //             GroupDetailFetchEvent(
              //               groupID: currentFarmer.farmer_group_id,
              //               token: logINState.successLoginEntity.token,
              //             ),
              //           );
              //     }
              //     await Navigator.push(
              //       context,
              //       PageAnimationWrapper.sharedAxisTransitionPageWrapper(
              //         const GroupDetailPage(),
              //       ),
              //     );
              //   },
              //   title: Text(currentFarmer.farmer_group_name),
              //   trailing: CircleAvatar(
              //     backgroundColor: Colors.green[800],
              //     child: Text(currentFarmer.total_farmers.toString()),
              //   ),
              // ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // mainAxisExtent: 50,
          ),
        );
      },
    );
  }
}
