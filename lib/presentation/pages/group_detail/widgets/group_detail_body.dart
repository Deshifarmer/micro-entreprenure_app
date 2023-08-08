import 'package:deshifarmer/core/app_core.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/presentation/cubit/add_group/add_farmer_to_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/group_detail/bloc/group_detail_bloc.dart';
import 'package:deshifarmer/presentation/pages/group_detail/components/group_detail_card.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/widgets/primary_btn.dart';
import 'package:flutter/material.dart';

/// {@template group_detail_body}
/// Body of the GroupDetailPage.
/// Add what it does
/// {@endtemplate}
class GroupDetailBody extends StatelessWidget {
  /// {@macro group_detail_body}
  GroupDetailBody({super.key});
  final DeshiFarmerAPI deshiFarmerAPI = DeshiFarmerAPI();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupDetailBloc, GroupDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GroupDetailLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GroupDetailFetchFailed) {
          return Center(
            child: Text('Data fetching Failed -> ${state.message}'),
          );
        }
        if (state is GroupDetailFetchSuccessFull) {
          return ListView(
            children: [
              GroupDetailCard(
                gdE: state.groupDetailEntity,
              ),
              // select Farmer
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'কৃষক সিলেক্ট করুন',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              const AddFarmerToTheAGroup(),
              PrimaryButtonGreen(
                onpress: () async {
                  final currentFarmer =
                      context.read<AddFarmerToGroupCubit>().state;
                  print('current farmer -> $currentFarmer');
                  final loginState = context.read<LoginBloc>().state;
                  if (loginState is LoginSuccess) {
                    if (state.groupDetailEntity.farmer_group_id != null) {
                      var res = await deshiFarmerAPI.addFarmerToGroupAPI(
                        loginState.successLoginEntity.token,
                        currentFarmer,
                        state.groupDetailEntity.farmer_group_id!,
                      );

                      final value = switch (res) {
                        Success(data: final succ) => succ,
                        ServerFailor(error: final err) => err,
                      };
                      if (value is bool) {
                        ///! successfully added
                        if (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Successfully added'),
                              backgroundColor: Colors.greenAccent,
                            ),
                          );
                          //* TODO: referesh the page by adding new event to the BLOC

                          context.read<GroupDetailBloc>().add(
                                GroupDetailFetchEvent(
                                  groupID:
                                      state.groupDetailEntity.farmer_group_id ??
                                          '',
                                  token: loginState.successLoginEntity.token,
                                  // token: logINState.successLoginEntity.token,
                                ),
                              );
                        }
                      } else {
                        ///! got an error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Got an Error $value'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    }
                  }
                  // addFarmerAPI
                },
                title: 'কৃষক যোগ',
              ),
              if (state.groupDetailEntity.farmer_list != null)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: DropdownButtonFormField<FarmerEntity>(
                    // padding: const EdgeInsets.all(10),
                    // menuMaxHeight: 80,
                    isDense: false,
                    // itemHeight: 100,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    isExpanded: true,
                    decoration: const InputDecoration(
                      label: Text(('গ্রুপ লিডার সিলেক্ট করুন')),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 2),
                        gapPadding: 10,
                      ),
                      filled: true,
                    ),
                    // decoration: ShapeDecoration(),
                    // itemHeight: 300,
                    elevation: 16,
                    value: state.groupDetailEntity.farmer_list.first,
                    // value: state.allFarmerListResp.farmers.first,
                    items: state.groupDetailEntity.farmer_list
                        .map<DropdownMenuItem<FarmerEntity>>((value) {
                      return DropdownMenuItem<FarmerEntity>(
                        alignment: Alignment.center,
                        value: value,
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '${Strings.domain}/storage/${value?.image}',
                              height: 50,
                              width: 50,
                            ),
                          ),
                          title: Text(value?.full_name ?? ''),
                          subtitle: Text(value?.phone ?? ''),
                        ),
                      );
                    }).toList(),
                    onChanged: (FarmerEntity? val) async {
                      // context.read<DropdownCubit>().changeDropdownValue(val ?? '');
                      // var addGroupState = context.read<AddGroupBloc>().state;
                      // if (addGroupState is AddGroupInitial) {
                      if (val?.farmer_id != null) {
                        context
                            .read<UpdateLeaderToGroupCubit>()
                            .updateLeader(val?.farmer_id ?? '');
                        print('farmer id -> ${val?.farmer_id}');
                      }
                      //   addGroupState.leaderID = val!.farmer_id;
                      // }
                    },
                  ),
                ),

              PrimaryButtonGreen(
                onpress: () async {
                  final updateLeader =
                      context.read<UpdateLeaderToGroupCubit>().state;
                  print('leader id -> $updateLeader');

                  final loginState = context.read<LoginBloc>().state;
                  if (loginState is LoginSuccess) {
                    if (state.groupDetailEntity.farmer_group_id != null) {
                      var res = await deshiFarmerAPI.updateLeaderToGroupAPI(
                        loginState.successLoginEntity.token,
                        updateLeader,
                        state.groupDetailEntity.farmer_group_id!,
                      );

                      final value = switch (res) {
                        Success(data: final succ) => succ,
                        ServerFailor(error: final err) => err,
                      };
                      if (value is bool) {
                        ///! successfully added
                        if (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Successfully added'),
                              backgroundColor: Colors.greenAccent,
                            ),
                          );
                          //* TODO: referesh the page by adding new event to the BLOC

                          context.read<GroupDetailBloc>().add(
                                GroupDetailFetchEvent(
                                  groupID:
                                      state.groupDetailEntity.farmer_group_id ??
                                          '',
                                  token: loginState.successLoginEntity.token,
                                  // token: logINState.successLoginEntity.token,
                                ),
                              );
                        }
                      } else {
                        ///! got an error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Got an Error $value'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    }
                  }
                },
                title: 'লিডার আপডেট',
              ),

              Text('এই গ্রুপ এর কৃষক সমূহ'),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.groupDetailEntity.farmer_list?.length ?? 0,
                itemBuilder: (context, index) {
                  var currentFarmer =
                      state.groupDetailEntity.farmer_list?.elementAt(index);
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          '${Strings.domain}/storage/${currentFarmer?.image}',
                          height: 50,
                          width: 50,
                        ),
                      ),
                      title: Text(currentFarmer?.full_name ?? ''),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(currentFarmer?.phone ?? ''),
                          Text(currentFarmer?.district ?? ''),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

/// TODO: Assigned Farmes in the Group api
/// TODO: Group leader Select API

class AddFarmerToTheAGroup extends StatelessWidget {
  const AddFarmerToTheAGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyUnassignFamersBloc, MyUnassignFamersState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is MyUnassignFarmerReqSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonFormField<FarmerEntity>(
              // padding: const EdgeInsets.all(10),
              // menuMaxHeight: 80,
              isDense: false,
              // itemHeight: 100,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              isExpanded: true,
              decoration: const InputDecoration(
                label: Text(('কৃষক সিলেক্ট করুন')),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 2),
                  gapPadding: 10,
                ),
                filled: true,
              ),
              // decoration: ShapeDecoration(),
              // itemHeight: 300,
              elevation: 16,
              value: state.allFarmerListResp.farmers.first,
              // value: state.allFarmerListResp.farmers.first,
              items: state.allFarmerListResp.farmers
                  .map<DropdownMenuItem<FarmerEntity>>((value) {
                return DropdownMenuItem<FarmerEntity>(
                  alignment: Alignment.center,
                  value: value,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        '${Strings.domain}/storage/${value.image}',
                        height: 50,
                        width: 50,
                      ),
                    ),
                    title: Text(value.full_name ?? ''),
                    subtitle: Text(value.phone ?? ''),
                  ),
                );
              }).toList(),
              onChanged: (FarmerEntity? val) {
                if (val?.farmer_id != null) {
                  context
                      .read<AddFarmerToGroupCubit>()
                      .addFarmer(val?.farmer_id ?? '');
                  print('farmer id -> ${val?.farmer_id}');
                }
              },
            ),
          );
        }

        return Text('no mfarjk');
      },
    );

    // return const Placeholder();
  }
}
