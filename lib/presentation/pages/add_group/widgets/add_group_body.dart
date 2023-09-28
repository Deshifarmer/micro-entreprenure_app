import 'package:deshifarmer/presentation/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_group/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/add_group/components/get_farmer_listo.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

/// {@template add_group_body}
/// Body of the AddGroupPage.
///
/// Add what it does
/// {@endtemplate}
class AddGroupBody extends StatelessWidget {
  /// {@macro add_group_body}
  const AddGroupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddGroupBloc, AddGroupState>(
      listener: (context, state) {
        if (state is GroupCreatedFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Group Created Failed'),
            ),
          );
        }
        if (state is GroupCreatedSuccessfully) {
          // context.read<>()

          final logINState = context.read<LoginBloc>().state;
          if (logINState is LoginSuccess) {
            context.read<GetGroupCubit>().addAllGroupFields(
                  logINState.successLoginEntity.token,
                );
            context.read<MyUnassignFamersBloc>().add(
                  MyUnassignFarmerFetchEvent(
                    logINState.successLoginEntity.token,
                  ),
                );
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Group Created Succesfully'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  // vertical: 20,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: state is AddGroupInitial
                      ? state.groupNameController
                      : null,
                  decoration: InputDecoration(
                    fillColor: backgroundColor2,
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          // color: Color(0xffaaaaaa).withOpacity(0.3),

                          // color: Colors.black.withOpacity(0.5),
                        )),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    labelText: 'গ্রুপের নাম লিখুন',
                    labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    filled: true,
                  ),
                ),
              ),
              // const SelectGroupLeader(),
              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: ElevatedButton(
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStatePropertyAll(Colors.green[600]),
              //     ),
              //     onPressed: () {
              //       final loginState = context.read<LoginBloc>().state;
              //       if (loginState is LoginSuccess && state is AddGroupInitial) {
              //         // print('token -> ${loginState.successLoginEntity.token}');
              //         // print('Group NAME -> ${state.groupNameController.text}');
              //         // print('Leader ID -> ${state.leaderID}');
              //         context.read<AddGroupBloc>().add(
              //               CustomAddGroupEvent(
              //                 groupName: state.groupNameController.text,
              //                 leaderID: state.leaderID ?? '',
              //                 token: loginState.successLoginEntity.token,
              //               ),
              //             );
              //       }
              //     },
              //     child: const Text(
              //       'গ্রুপ তৈরি করুন',
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),

              const GetFarmerListo(),
            ],
          ),
        );
      },
    );
  }
}
