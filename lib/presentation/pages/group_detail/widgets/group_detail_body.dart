import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_core.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';

import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/group_detail/bloc/group_detail_bloc.dart';
import 'package:deshifarmer/presentation/pages/group_detail/widgets/group_leader_card.dart';
import 'package:deshifarmer/presentation/pages/group_detail/widgets/single_farmer_wid.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/services/blocs/user_profile/user_profile_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

/// Body of the GroupDetailPage.
class GroupDetailBody extends StatelessWidget {
  GroupDetailBody({super.key});
  final DeshiFarmerAPI deshiFarmerAPI = DeshiFarmerAPI();
  @override
  Widget build(BuildContext context) {
    final myState = context.read<UserProfileBloc>().state;
    return BlocConsumer<GroupDetailBloc, GroupDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GroupDetailLoading) {
          return const Center(
            child: PrimaryLoadingIndicator(),
          );
        }
        if (state is GroupDetailFetchFailed) {
          return Center(
            child: Text('Data fetching Failed -> ${state.message}'),
          );
        }
        if (state is GroupDetailFetchSuccessFull) {
          debugPrint('succes detail :)');
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const Text(
                  'গ্রুপ',
                ),
                Text(
                  state.groupDetailEntity.farmer_group_name ?? '',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: secondaryColor,
                      ),
                ),
                SizedBox(
                  // color: const Color.fromARGB(255, 216, 144, 138),
                  height: getProportionateScreenHeight(143),
                  child: Row(
                    children: [
                      if (myState is UserProfileFetchSuccess)
                        GroupLeaderCard(
                          image:
                              '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${myState.userProfile.photo}',
                          title:
                              '${myState.userProfile.full_name} (ME) Manager',
                        ),
                      // ignore: lines_longer_than_80_chars
                      GestureDetector(
                        onTap: () {
                          final loginState = context.read<LoginBloc>().state;
                          final token = loginState is LoginSuccess
                              ? loginState.successLoginEntity.token
                              : '';
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: getProportionateScreenHeight(10),
                                      width: double.infinity,
                                    ),
                                    Text(
                                      'নতুন লীডার সিলেক্ট করুন',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                    //! show list of all the member of the group
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: state.groupDetailEntity
                                            .farmer_list.length,
                                        itemBuilder: (context, index) {
                                          final value = state
                                              .groupDetailEntity.farmer_list
                                              .elementAt(index);
                                          return ListTile(
                                            onTap: () {
                                              // show an alert dialog if the user wants to add the farmer to the group
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: const Text(
                                                    'লীডার সিলেক্ট করুন',
                                                  ),
                                                  // content: Text(
                                                  //   'আপনি কি ${value?.full_name} কৃষককে গ্রুপের লিডার বানাতে চান?',
                                                  // ),
                                                  content: RichText(
                                                    text: TextSpan(
                                                      text: 'আপনি কি ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge,
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              '${value?.full_name}',
                                                          style: Theme.of(
                                                            context,
                                                          )
                                                              .textTheme
                                                              .bodyLarge!
                                                              .copyWith(
                                                                color:
                                                                    primaryColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        const TextSpan(
                                                          text:
                                                              ' কৃষককে গ্রুপের লিডার বানাতে চান?',
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(
                                                          context,
                                                        );
                                                      },
                                                      child: const Text(
                                                        'না',
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () async {
                                                        final deshiFarmerAPI =
                                                            DeshiFarmerAPI();
                                                        // addFarmerToGroupAPI
                                                        final res =
                                                            await deshiFarmerAPI
                                                                .updateLeaderToGroupAPI(
                                                          token,
                                                          value?.farmer_id ??
                                                              '',
                                                          state.groupDetailEntity
                                                                  .farmer_group_id ??
                                                              '',
                                                        );

                                                        //! check if the res is success or not
                                                        final res2 =
                                                            switch (res) {
                                                          Success(
                                                            data: final succ
                                                          ) =>
                                                            succ,
                                                          ServerFailor(
                                                            error: final err
                                                          ) =>
                                                            err,
                                                        };
                                                        if (res2 is bool) {
                                                          if (res2 == true) {
                                                            // successfully added
                                                            ScaffoldMessenger
                                                                .of(
                                                              context,
                                                            ).showSnackBar(
                                                              const SnackBar(
                                                                content: Text(
                                                                  'গ্রুপের লিডার আপডেট  সম্পন্ন হয়েছে',
                                                                ),
                                                                backgroundColor:
                                                                    Colors
                                                                        .greenAccent,
                                                              ),
                                                            );
                                                            // refresh the page
                                                            context
                                                                .read<
                                                                    GroupDetailBloc>()
                                                                .add(
                                                                  GroupDetailFetchEvent(
                                                                    groupID: state
                                                                            .groupDetailEntity
                                                                            .farmer_group_id ??
                                                                        '',
                                                                    token:
                                                                        token,
                                                                    // token: logINState.successLoginEntity.token,
                                                                  ),
                                                                );
                                                          } else {
                                                            // got an error
                                                            ScaffoldMessenger
                                                                .of(
                                                              context,
                                                            ).showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'গ্রুপের লিডার আপডেট করতে ব্যর্থ হয়েছে $res2',
                                                                ),
                                                                backgroundColor:
                                                                    Colors
                                                                        .redAccent,
                                                              ),
                                                            );
                                                          }
                                                        } else {
                                                          // got an error
                                                          ScaffoldMessenger.of(
                                                            context,
                                                          ).showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Got an Error $res2',
                                                              ),
                                                              backgroundColor:
                                                                  Colors
                                                                      .redAccent,
                                                            ),
                                                          );
                                                        }
                                                        Navigator.pop(
                                                          context,
                                                        );
                                                      },
                                                      child: const Text(
                                                        'হ্যাঁ',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            leading: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${value?.image}',
                                                height: 50,
                                                width: 50,
                                              ),
                                            ),
                                            title: Text(
                                              value?.full_name ?? '',
                                            ),
                                            subtitle: Text(value?.phone ?? ''),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: GroupLeaderCard(
                          image:
                              '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${state.groupDetailEntity.group_leader?.image}',
                          title:
                              '${state.groupDetailEntity.group_leader?.full_name} (Leader)',
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.face_outlined,
                      color: Colors.black.withOpacity(0.54),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(15),
                    ),
                    Text(
                      'এই গ্রুপ এর কৃষক সমূহ',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: secondaryColor,
                              ),
                    ),
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.groupDetailEntity.farmer_list.length + 1,
                  itemBuilder: (context, index) {
                    debugPrint(
                      'index -> $index || ${state.groupDetailEntity.farmer_list.length} ${state.groupDetailEntity.farmer_list.length == index}',
                    );
                    if (index == state.groupDetailEntity.farmer_list.length) {
                      return GestureDetector(
                        onTap: () {
                          final loginState = context.read<LoginBloc>().state;
                          final token = loginState is LoginSuccess
                              ? loginState.successLoginEntity.token
                              : '';
                          // MyUnassignFamersBloc
                          context.read<MyUnassignFamersBloc>().add(
                                MyUnassignFarmerFetchEvent(token),
                              );
                          // show a bottom sheet where all the unassigned farmers are listed
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              // return const AddFarmerToTheAGroup();
                              return Column(
                                children: [
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                    width: double.infinity,
                                  ),
                                  Text(
                                    'কৃষক সিলেক্ট করুন',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                  // show list of all the unassigned farmers
                                  BlocConsumer<MyUnassignFamersBloc,
                                      MyUnassignFamersState>(
                                    listener: (context, unassignFamers) {},
                                    builder: (context, unassignFamers) {
                                      if (unassignFamers
                                          is MyUnassignFarmerReqSuccess) {
                                        final allFarmers = unassignFamers
                                            .allFarmerListResp.farmers;
                                        return Expanded(
                                          child: ListView.builder(
                                            itemCount: allFarmers.length,
                                            itemBuilder: (context, index) {
                                              final value =
                                                  allFarmers.elementAt(index);
                                              return ListTile(
                                                onTap: () {
                                                  // show an alert dialog if the user wants to add the farmer to the group
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      title: const Text(
                                                        'কৃষক যোগ করুন',
                                                      ),
                                                      // content: Text(
                                                      //   'আপনি কি ${value.full_name} কৃষককে গ্রুপে যোগ করতে চান?',
                                                      // ),
                                                      content: RichText(
                                                        text: TextSpan(
                                                          text: 'আপনি কি ',
                                                          style: Theme.of(
                                                            context,
                                                          ).textTheme.bodyLarge,
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  '${value.full_name}',
                                                              style: Theme.of(
                                                                context,
                                                              )
                                                                  .textTheme
                                                                  .bodyLarge!
                                                                  .copyWith(
                                                                    color:
                                                                        primaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                            const TextSpan(
                                                              text:
                                                                  ' কৃষককে গ্রুপে যোগ করতে চান?',
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                          },
                                                          child: const Text(
                                                            'না',
                                                          ),
                                                        ),
                                                        TextButton(
                                                          onPressed: () async {
                                                            final deshiFarmerAPI =
                                                                DeshiFarmerAPI();
                                                            // addFarmerToGroupAPI
                                                            final res =
                                                                await deshiFarmerAPI
                                                                    .addFarmerToGroupAPI(
                                                              token,
                                                              value.farmer_id ??
                                                                  '',
                                                              state.groupDetailEntity
                                                                      .farmer_group_id ??
                                                                  '',
                                                            );

                                                            //! check if the res is success or not
                                                            final res2 =
                                                                switch (res) {
                                                              Success(
                                                                data: final succ
                                                              ) =>
                                                                succ,
                                                              ServerFailor(
                                                                error: final err
                                                              ) =>
                                                                err,
                                                            };
                                                            if (res2 is bool) {
                                                              if (res2 ==
                                                                  true) {
                                                                // successfully added
                                                                ScaffoldMessenger
                                                                    .of(
                                                                  context,
                                                                ).showSnackBar(
                                                                  const SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Successfully added',
                                                                    ),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .greenAccent,
                                                                  ),
                                                                );
                                                                // refresh the page
                                                                context
                                                                    .read<
                                                                        GroupDetailBloc>()
                                                                    .add(
                                                                      GroupDetailFetchEvent(
                                                                        groupID:
                                                                            state.groupDetailEntity.farmer_group_id ??
                                                                                '',
                                                                        token:
                                                                            token,
                                                                        // token: logINState.successLoginEntity.token,
                                                                      ),
                                                                    );
                                                              } else {
                                                                // got an error
                                                                ScaffoldMessenger
                                                                    .of(
                                                                  context,
                                                                ).showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Got an Error $res2',
                                                                    ),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .redAccent,
                                                                  ),
                                                                );
                                                              }
                                                            } else {
                                                              // got an error
                                                              ScaffoldMessenger
                                                                  .of(
                                                                context,
                                                              ).showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Got an Error $res2',
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .redAccent,
                                                                ),
                                                              );
                                                            }
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                          },
                                                          child: const Text(
                                                            'হ্যাঁ',
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                leading: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10,
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${value.image}',
                                                    height: 50,
                                                    width: 50,
                                                  ),
                                                ),
                                                title: Text(
                                                  value.full_name ?? '',
                                                ),
                                                subtitle:
                                                    Text(value.phone ?? ''),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DottedBorder(
                                borderType: BorderType.Circle,
                                padding: const EdgeInsets.all(10),
                                child: const Icon(
                                  Icons.add,
                                  // size: 50,
                                ),
                              ),
                              const Text('কৃষক যোগ করুন'),
                            ],
                          ),
                        ),
                      );
                    }
                    final currentFarmer =
                        state.groupDetailEntity.farmer_list.elementAt(index);
                    return SingleFarmerCard(
                      image:
                          '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${currentFarmer?.image}',
                      // title: currentFarmer?.full_name ?? '',
                      // phone: currentFarmer?.phone ?? '',
                      gfe: currentFarmer,
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // childAspectRatio: 4 / 4,
                  ),
                ),
              ],
            ),
          );
          // return Text('hola');
        }
        return const SizedBox.shrink();
      },
    );
  }
}
