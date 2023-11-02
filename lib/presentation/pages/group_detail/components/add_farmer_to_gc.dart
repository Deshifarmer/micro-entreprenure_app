import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/services/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/services/cubit/add_group/add_farmer_to_group_cubit.dart';
import 'package:flutter/material.dart';



class AddFarmerToTheAGroup extends StatelessWidget {
  const AddFarmerToTheAGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyUnassignFamersBloc, MyUnassignFamersState>(
      listener: (context, state) {
        
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
                label: Text('কৃষক সিলেক্ট করুন'),
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
                      child: CachedNetworkImage(
                        imageUrl:
                            '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${value.image}',
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
                  debugPrint('farmer id -> ${val?.farmer_id}');
                }
              },
            ),
          );
        }

        return const Text('no mfarjk');
      },
    );

    // return const Placeholder();
  }
}
