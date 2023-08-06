import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/presentation/pages/add_group/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/add_group/components/get_farmer_listo.dart';
import 'package:deshifarmer/presentation/pages/add_group/components/select_group_leader.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
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
    return BlocBuilder<AddGroupBloc, AddGroupState>(
      builder: (context, state) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller:
                    state is AddGroupInitial ? state.groupNameController : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelText: 'গ্রুপের নাম লিখুন',
                  filled: true,
                ),
              ),
            ),
            const SelectGroupLeader(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green[600]),
                ),
                onPressed: () {
                  final loginState = context.read<LoginBloc>().state;
                  if (loginState is LoginSuccess && state is AddGroupInitial) {
                    print('token -> ${loginState.successLoginEntity.token}');
                    print('Group NAME -> ${state.groupNameController.text}');
                    print('Leader ID -> ${state.leaderID}');
                    context.read<AddGroupBloc>().add(CustomAddGroupEvent(
                          groupName: state.groupNameController.text,
                          leaderID: state.leaderID ?? '',
                          token: loginState.successLoginEntity.token,
                        ));
                  }
                },
                child: const Text(
                  'গ্রুপ তৈরি করুন',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'গ্রুপ লিস্ট',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const GetFarmerListo(),
          ],
        );
      },
    );
  }
}
