import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/all_farmer_entity.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class SelectFarmerMethodsForHarvests extends StatelessWidget {
  const SelectFarmerMethodsForHarvests({
    required this.selectFarmerController,
    super.key,
  });

  final TextEditingController selectFarmerController;
  @override
  Widget build(BuildContext context) {
    final loginState = context.watch<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';

    return FutureBuilder<AllFarmerListResp?>(
      future: DeshiFarmerAPI().getFarmers2(token),
      builder:
          (BuildContext context, AsyncSnapshot<AllFarmerListResp?> snapshot) {
        if (snapshot.hasData) {
          debugPrint('yesh farmer has data!!');
          if (snapshot.data == null) {
            debugPrint('got null from farmer list');
            return const SizedBox.shrink();
          } else {
            debugPrint('asdfhoasdifqwe aqweraaa');
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'কৃষক নির্বাচন করুন',
                  ),
                  DropdownButtonFormField<FarmerEntity>(
                    isExpanded: true,
                    // itemHeight: 300,
                    // menuMaxHeight: 200,

                    decoration: InputDecoration(
                      fillColor: backgroundColor2,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        // vertical: 20,
                        horizontal: 15,
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      hintText: '',
                      filled: true,
                    ),
                    hint: const Text('কৃষক নির্বাচন করুন'),
                    elevation: 16,
                    // value: snapshot.data?.farmers.first,
                    items: snapshot.data?.farmers
                        .map<DropdownMenuItem<FarmerEntity>>((value) {
                      return DropdownMenuItem<FarmerEntity>(
                        alignment: Alignment.center,
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5,),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${value.image}',
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                value.full_name ?? '',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              if (value.phone != null)
                                if (value.phone!.isNotEmpty)
                                  Text(
                                    ' (${value.phone})',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (FarmerEntity? val) {
                      if (val != null) {
                        selectFarmerController.text = val.farmer_id ?? '';
                      }
                    },
                  ),
                ],
              ),
            );
          }
        }
        debugPrint('got nothing from farmer list');
        return const SizedBox.shrink();
      },
    );
    /*
    return BlocConsumer<MyFarmerBloc, MyFarmerState>(
      listener: (context, state) {
        // if state is myfarmersuccess then insert a dummy FarmerEntity to the dropdown
        if (state is MyFarmerSuccess) {
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
              ));
        }
      },
      builder: (context, state) {
        if (state is MyFarmerSuccess) {
          // debugPrint(
          //   '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${state.allFarmerListResp.farmers.first.image}',
          // );

          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'কোন কৃষকের জন্য অর্ডারটি করছেন ?',
                ),
                DropdownButtonFormField<FarmerEntity>(
                  isExpanded: true,
                  // itemHeight: 300,
                  // menuMaxHeight: 200,

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
                      gapPadding: 5,
                    ),
                    // contentPadding: EdgeInsets.all(1),
                    filled: true,
                  ),
                  elevation: 16,
                  value: state.allFarmerListResp.farmers.first,
                  items: state.allFarmerListResp.farmers
                      .map<DropdownMenuItem<FarmerEntity>>((value) {
                    return DropdownMenuItem<FarmerEntity>(
                      alignment: Alignment.center,
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 5),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${value.image}',
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              value.full_name ?? '',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            if (value.phone != null)
                              if (value.phone!.isNotEmpty)
                                Text(
                                  ' (${value.phone})',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (FarmerEntity? val) {
                    if (val != null) {
                      context
                          .read<DropdownForFarmerCubit>()
                          .changeDropdownValue(val);
                    }
                  },
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      
      },
    );
    */
  }
}
