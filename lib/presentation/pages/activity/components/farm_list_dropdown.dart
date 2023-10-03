import 'package:deshifarmer/domain/entities/farm_entity/farm_entity.dart';
import 'package:deshifarmer/presentation/blocs/farmer_fetch_farm/farmer_fetch_farm_bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/bloc/bloc.dart';
import 'package:flutter/material.dart';

class FarmListDropDown extends StatelessWidget {
  const FarmListDropDown({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    // final farmFetchState = context.read<FarmerFetchFarmBloc>().state;
    final activityState = context.read<ActivityBloc>().state;
    return BlocConsumer<FarmerFetchFarmBloc, FarmerFetchFarmState>(
      listener: (context, state) {
        debugPrint('getting farm state  -> $state');
      },
      builder: (context, FarmerFetchFarmState state) {
        if (state is FarmerFetchFarmSuccess) {
          if (state.allFarmListo.allCompany.isEmpty) {
            return const Text('This Farmer has no Farm');
          }
          return DropdownButtonFormField<FarmEntity>(
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
            value: state.allFarmListo.allCompany.isNotEmpty
                ? state.allFarmListo.allCompany.first
                : null,
            items: state.allFarmListo.allCompany
                .map<DropdownMenuItem<FarmEntity>>((value) {
              return DropdownMenuItem<FarmEntity>(
                alignment: Alignment.center,
                value: value,
                child: ListTile(
                  title: Text(value.farm_name),
                  subtitle: Text(value.farm_id),
                ),
              );
            }).toList(),

            onChanged: (FarmEntity? val) {
              if (activityState is ActivityInitial) {
                if (val != null) {
                  activityState.farmID.text = val.farm_id;
                }
              }
            },
          );
        } else if (state is FarmerFetchFarmFailed) {
          return const Text('Farm Fetching Failed');
        } else if (state is FarmerFetchFarmLoading) {
          return const CircularProgressIndicator.adaptive();
        }
        return const SizedBox.shrink();
        // return const Text('Init State');
      },
    );
  }
}
