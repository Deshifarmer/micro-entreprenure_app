import 'package:deshifarmer/presentation/pages/add_group/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/add_group/components/get_farmer_listo.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/services/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/services/cubit/groups/get_group_cubit.dart';
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
            
            context.read<MyUnassignFamersBloc>().add(
                  MyUnassignFarmerFetchEvent(
                    logINState.successLoginEntity.token,
                  ),
                );
          }
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: priceBoxColor,
              content: Text('Group Created Succesfully'),
            ),
          );
        }
      },
      builder: (context, state) {
        final loginState = context.read<LoginBloc>().state;
        final token = loginState is LoginSuccess
            ? loginState.successLoginEntity.token
            : '';
        return Padding(
          padding: const EdgeInsets.all(10),
          child: GetFarmerListo(
            token: token,
          ),
        );
      },
    );
  }
}
