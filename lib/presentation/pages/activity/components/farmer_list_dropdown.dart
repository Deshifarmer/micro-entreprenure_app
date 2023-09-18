import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:flutter/material.dart';

class FarmerListDropDown extends StatelessWidget {
  const FarmerListDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final activityState = context.read<ActivityBloc>().state;
    final loginState = context.read<LoginBloc>().state;
    return BlocConsumer<MyFarmerBloc, MyFarmerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MyFarmerInitial) {
          return const Center(
            child: PrimaryLoadingIndicator(),
          );
        } else if (state is MyFarmerFailed) {
          return const Center(
            child: Text(
              'Famer Fetched Failed',
            ),
          );
        } else if (state is MyFarmerSuccess) {
          ///! TODO: uncomment this
          // if (activityState is ActivityInitial) {
          //   activityState.farmerID.text =
          //       state.allFarmerListResp.first.farmer_id!;
          // }
          ///! TODO: uncomment this
          /*
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: DropdownButtonFormField<FarmerEntity>(
              isDense: false,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              isExpanded: true,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  // vertical: 5,
                ),
                // label: Text('কৃষক নির্বাচন করুন'),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                  gapPadding: 10,
                ),
                filled: true,
              ),
              // decoration: ShapeDecoration(),
              // itemHeight: 300,
              elevation: 16,
              value: state.allFarmerListResp.isNotEmpty
                  ? state.allFarmerListResp.first
                  : null,
              items: state.allFarmerListResp
                  .map<DropdownMenuItem<FarmerEntity>>((value) {
                return DropdownMenuItem<FarmerEntity>(
                  alignment: Alignment.center,
                  value: value,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        checkDomain(
                                Strings.getServerOrLocal(ServerOrLocal.server))
                            ? dummyImage
                            : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${value.image}',
                        height: 40,
                        width: 40,
                        errorBuilder: (
                          context,
                          error,
                          stackTrace,
                        ) {
                          return SizedBox.shrink();
                        },
                      ),
                    ),
                    title: Text(value.full_name ?? ''),
                    subtitle: Text(value.phone ?? ''),
                  ),
                );
              }).toList(),

              onChanged: (FarmerEntity? val) {
                print('on pressed called');
                if (activityState is ActivityInitial) {
                  print('is activity called');
                  if (val != null) {
                    if (loginState is LoginSuccess) {
                      print('log in state good. Calling FarmEvent');
                      context.read<FarmerFetchFarmBloc>().add(
                            FramFetchEvent(
                              token: loginState.successLoginEntity.token,
                              farmerID: val.farmer_id!,
                            ),
                          );
                    }
                    activityState.farmerID.text = val.farmer_id!;
                  }
                }
              },
            ),
          );
          */
        }
        return const SizedBox.shrink();
      },
    );
  }
}
