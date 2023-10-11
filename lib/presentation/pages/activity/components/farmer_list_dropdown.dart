import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/farmer_fetch_farm/farmer_fetch_farm_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class FarmerListDropDown extends StatelessWidget {
  FarmerListDropDown({super.key, required this.allFarmers});
  List<FarmerEntity> allFarmers;
  @override
  Widget build(BuildContext context) {
    final activityState = context.read<ActivityBloc>().state;
    final loginState = context.read<LoginBloc>().state;
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
        hint: const Text('কৃষক নির্বাচন করুন'),
        // decoration: ShapeDecoration(),
        // itemHeight: 300,
        elevation: 16,
        // value: state.allFarmerListResp.farmers.isNotEmpty
        //     ? state.allFarmerListResp.farmers.first
        //     : null,
        items: allFarmers.map<DropdownMenuItem<FarmerEntity>>((value) {
          return DropdownMenuItem<FarmerEntity>(
            alignment: Alignment.center,
            value: value,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  checkDomain(Strings.getServerOrLocal(ServerOrLocal.server))
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
          debugPrint('on pressed called');
          if (activityState is ActivityInitial) {
            debugPrint('is activity called');
            if (val != null) {
              if (loginState is LoginSuccess) {
                debugPrint('log in state good. Calling FarmEvent');
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
}
