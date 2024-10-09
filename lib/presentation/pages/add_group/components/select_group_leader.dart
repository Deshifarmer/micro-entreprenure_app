import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/presentation/pages/add_group/bloc/bloc.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

class SelectGroupLeader extends StatefulWidget {
  const SelectGroupLeader({
    super.key,
  });

  @override
  State<SelectGroupLeader> createState() => _SelectGroupLeaderState();
}

class _SelectGroupLeaderState extends State<SelectGroupLeader> {
  final List<FarmerEntity> _farmerList = [];
  @override
  void initState() {
    super.initState();
    // insert an empty farmer entity to the list
    _farmerList.add(const FarmerEntity(
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
    ),);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyUnassignFamersBloc, MyUnassignFamersState>(
      listener: (context, state) {
        if (state is MyUnassignFarmerReqSuccess) {
          _farmerList.addAll(state.allFarmerListResp.data);
        }
      },
      builder: (context, state) {
        if (state is MyUnassignFarmerReqSuccess) {
          return ExpansionTile(
            title: const Text(
              'গ্রুপ লিডার থাকলে এইখানে ক্লিক করুন এবং গ্রুপ লিডার সিলেক্ট করুন',
            ),
            children: [
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
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    label: Text('গ্রুপ লিডার নির্বাচন করুন'),
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
                  elevation: 0,
                  // value: state.allFarmerListResp.farmers.isNotEmpty
                  //     ? state.allFarmerListResp.farmers.first
                  //     : null,
                  value: _farmerList.isNotEmpty ? _farmerList.first : null,
                  items:
                      _farmerList.map<DropdownMenuItem<FarmerEntity>>((value) {
                    return DropdownMenuItem<FarmerEntity>(
                      alignment: Alignment.center,
                      value: value,
                      // child: ListTile(
                      //   leading: ClipRRect(
                      //     borderRadius: BorderRadius.circular(10),
                      //     child: Image.network(
                      //       checkDomain(
                      //         Strings.getServerOrLocal(
                      //           ServerOrLocal.server,
                      //         ),
                      //       )
                      //           ? dummyImage
                      //           : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${value.image}',
                      //       height: 50,
                      //       width: 50,
                      //     ),
                      //   ),
                      //   title: Text(value.full_name ?? ''),
                      //   // subtitle: Text(value.phone ?? ''),
                      // ),
                      child: Row(
                        children: [
                          if (value.image?.isNotEmpty ?? false)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: checkDomain(
                                  Strings.getServerOrLocal(
                                    ServerOrLocal.server,
                                  ),
                                )
                                    ? dummyImage
                                    : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${value.image}',
                                height: 50,
                                width: 50,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: Colors.green[600],
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(width: getProportionateScreenWidth(15)),
                          Text(value.full_name ?? ''),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (FarmerEntity? val) {
                    final addGroupState = context.read<AddGroupBloc>().state;
                    if (addGroupState is AddGroupInitial) {
                      addGroupState.leaderID = val!.farmer_id;
                    }
                  },
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
