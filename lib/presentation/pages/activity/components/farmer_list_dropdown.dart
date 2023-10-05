import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/farmer_fetch_farm/farmer_fetch_farm_bloc.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:flutter/material.dart';

class FarmerListDropDown extends StatelessWidget {
  const FarmerListDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final activityState = context.read<ActivityBloc>().state;
    final loginState = context.read<LoginBloc>().state;
    return BlocConsumer<MyFarmerBloc, MyFarmerState>(
      listener: (context, state) {
        if (state is MyFarmerSuccess) {
          // insert a dummy farmer id to avoid null error
          state.allFarmerListResp.farmers.insert(
            0,
            const FarmerEntity(
              farmer_id: 'x',
              full_name: '------------',
              phone: '',
              image: '',
              address: '',
              farmer_type: '',
              onboard_by: '',
              usaid_id: '',
              first_name: '',
              last_name: '',
              fathers_name: '',
              is_married: '',
              gender: '',
              date_of_birth: '',
              village: '',
              upazila: '',
              district: '',
              division: '',
              union: '',
              credit_score: '',
              residentType: '',
              land_status: '',
              year_of_stay_in: '',
              group_id: '',
              bank_details: '',
              mfs_account: '',
              current_producing_crop: '',
              focused_crop: '',
              cropping_intensity: '',
              cultivation_practice: '',
              farmer_role: '',
              farm_id: '',
              order_list: [],
            ),
          );
        }
      },
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
          if (activityState is ActivityInitial) {
            activityState.farmerID.text =
                state.allFarmerListResp.farmers.first.farmer_id!;
          }
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
              value: state.allFarmerListResp.farmers.isNotEmpty
                  ? state.allFarmerListResp.farmers.first
                  : null,
              items: state.allFarmerListResp.farmers
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
                          return const SizedBox.shrink();
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
        }
        return const SizedBox.shrink();
      },
    );
  }
}
