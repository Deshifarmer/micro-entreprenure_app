import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/cubit/dropdown/dropdown_cubit.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class SelectFarmerMethods extends StatelessWidget {
  const SelectFarmerMethods({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyFarmerBloc, MyFarmerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MyFarmerSuccess) {
          // print(
          //   '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${state.allFarmerListResp.farmers.first.image}',
          // );

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('কোন কৃষকের জন্য অর্ডারটি করছেন ?'),
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
                      contentPadding: EdgeInsets.all(1),
                      filled: true,
                    ),

                    // decoration: ShapeDecoration(),
                    // itemHeight: 300,
                    elevation: 16,
                    value: state.allFarmerListResp.farmers.first,
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
                            ),
                          ),
                          title: Text(value.full_name ?? ''),
                          subtitle: Text(value.phone ?? ''),
                        ),
                      );
                    }).toList(),
                    onChanged: (FarmerEntity? val) {
                      if (val != null)
                        context
                            .read<DropdownForFarmerCubit>()
                            .changeDropdownValue(val);
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
