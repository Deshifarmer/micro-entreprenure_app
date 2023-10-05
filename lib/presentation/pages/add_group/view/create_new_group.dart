import 'package:deshifarmer/presentation/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/add_group/bloc/add_group_bloc.dart';
import 'package:deshifarmer/presentation/pages/add_group/components/select_group_leader.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

class CreateGroupForm extends StatelessWidget {
  const CreateGroupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        surfaceTintColor: backgroundColor2,
      ),
      body: BlocConsumer<AddGroupBloc, AddGroupState>(
        listener: (context, state) {
          if (state is GroupCreatedFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text('গ্রুপ তৈরি করা ব্যর্থ হয়েছে৷'),
                // content: Text('Group Created Failed'),
              ),
            );
          }
          if (state is GroupCreatedSuccessfully) {
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
                content: Text('গ্রুপ সফলভাবে তৈরি করা হয়েছে'),
                // content: Text('Group Created Succesfully'),
              ),
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                Text(
                  'নির্দেশিকা:',
                  // Text('Guide:',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: secondaryColor,
                      ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'গ্রুপ এর নাম নির্বাচন করুন',
                    // text: 'Select a name',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    children: [
                      // TextSpan(
                      //   text: ' আপনি এই গ্রুপ কল করতে চান',
                      //   // text: ' you want to call this group',
                      //   style: Theme.of(context).textTheme.bodyMedium,
                      // ),
                      TextSpan(
                        text: '\n ex: sherpur squad, powerhouse',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 20),

                /// Select a group leader
                RichText(
                  text: TextSpan(
                    text: 'একটি গ্রুপ লিডার নির্বাচন করুন:\n',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    children: [
                      TextSpan(
//                         text: '''
// This is the lead farmer who has normally some sort of influence on others.
// A lead farmer is also able to pass your instruction and keep you updated
// about their operations for production.''',
                        text: '''
এই হল প্রধান কৃষক যারা সাধারণত অন্যদের উপর একরকম প্রভাব ফেলে। একজন প্রধান কৃষক আপনার নির্দেশনা পাস করতে এবং উৎপাদনের জন্য তাদের ক্রিয়াকলাপ সম্পর্কে আপনাকে আপডেট রাখতে সক্ষম।.''',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  maxLines: 6,
                ),
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //icon
                      const Icon(Icons.sort),
                      const SizedBox(width: 15),
                      // title
                      Text(
                        'গ্রুপের নাম নির্বাচন করুন',
                        // Text('Choose a group name',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: secondaryColor,
                            ),
                      ),
                      // empty shit
                      // SizedBox.shrink(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(9),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: state is AddGroupInitial
                        ? state.groupNameController
                        : null,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'গ্রুপের নাম লিখুন',
                      filled: true,
                    ),
                  ),
                ),
                const SelectGroupLeader(),

                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SecondayButtonGreen(
                    // style: ButtonStyle(
                    //   backgroundColor: MaterialStatePropertyAll(
                    //     secondaryColor,
                    //   ),
                    // ),
                    onpress: () {
                      print('clikcing button');
                      final loginState = context.read<LoginBloc>().state;
                      if (loginState is LoginSuccess &&
                          state is AddGroupInitial) {
                        print(
                          'token -> ${loginState.successLoginEntity.token}',
                        );
                        print(
                          'Group NAME -> ${state.groupNameController.text}',
                        );
                        if (state.groupNameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('গ্রুপের নাম লিখুন'),
                              // content: Text('Enter a group name'),
                            ),
                          );
                          return;
                        }
                        print('Leader ID -> ${state.leaderID}');
                        if (state.leaderID == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('গ্রুপ লিডার নির্বাচন করুন'),
                              // content: Text('Select a group leader'),
                            ),
                          );
                          return;
                        }
                        if (state.leaderID == 'x') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('গ্রুপ লিডার নির্বাচন করুন'),
                              // content: Text('Select a group leader'),
                            ),
                          );
                          return;
                        }
                        context.read<AddGroupBloc>().add(
                              CustomAddGroupEvent(
                                groupName: state.groupNameController.text,
                                leaderID: state.leaderID ?? '',
                                token: loginState.successLoginEntity.token,
                              ),
                            );
                      }
                    },
                    // child: const Text(
                    //   'গ্রুপ তৈরি করুন',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                    title: 'গ্রুপ তৈরি করুন',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
