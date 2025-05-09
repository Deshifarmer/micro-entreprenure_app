import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/domain/entities/group_detail_entity/group_detail_entity.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/all_farmer_group_field.dart';
import 'package:deshifarmer/domain/entities/group_field_entity/group_field_entity.dart';

import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/bloc/agri_advisory_bloc.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/components/farmer_list_selectable.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/components/paginate_single_farmer.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/cubit/list_for_farmers_cubit.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/widgets/agri_advisory_body.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/services/cubit/groups/get_group_cubit.dart';
import 'package:flutter/material.dart';

class SelectableGroupOrFarmer extends StatefulWidget {
  const SelectableGroupOrFarmer({super.key});

  @override
  State<SelectableGroupOrFarmer> createState() =>
      _SelectableGroupOrFarmerState();
}

class _SelectableGroupOrFarmerState extends State<SelectableGroupOrFarmer> {
  final List<String> _selectedValues = ['Farmer Group', 'Single Farmer'];
  String selectValue = 'Farmer Group';
  bool isDropDownOpened = false;
  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        widgetHeight(20),
        Row(
          children: [
            /// HACK: farmer groups
            Row(
              children: [
                Radio(
                  activeColor: priceBoxColor,
                  value: _selectedValues.first,
                  groupValue: selectValue,
                  onChanged: (String? val) {
                    if (val != null) {
                      context.read<ListForFarmersCubit>().resetListForFarmers();
                      selectValue = val;
                      setState(() {});
                    }
                  },
                ),
                const Text(
                  'Farmer Group',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),

            widgetWeight(getProportionateScreenWidth(20)),

            /// PREF: single farmer select
            Row(
              children: [
                Radio(
                  activeColor: priceBoxColor,
                  value: _selectedValues.last,
                  groupValue: selectValue,
                  onChanged: (String? val) async {
                    if (val != null) {
                      context.read<ListForFarmersCubit>().resetListForFarmers();
                      selectValue = val;
                      setState(() {});
                    }
                    await showModalBottomSheet(
                      context: context,
                      builder: (x) {
                        return const SingleFarmerSelectPaginate();
                      },
                    );
                  },
                ),
                const Text(
                  'Single Farmer',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        // a dropdown

        widgetHeight(20),

        if (selectValue == _selectedValues.first)
          FutureBuilder<AllFarmerGroupFieldResp?>(
            future: DeshiFarmerAPI().getGroupFields2(token),
            builder: (BuildContext context,
                AsyncSnapshot<AllFarmerGroupFieldResp?> snapshot) {
              if (snapshot.hasData &&
                  snapshot.data != null &&
                  snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data?.farmers.isEmpty ?? true) {
                  return const Center(child: Text('কোনো গ্রুপ পাওয়া যায় নি'));
                } else {
                  return DropdownButtonFormField<GroupFieldEntity>(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    dropdownColor: backgroundColor2,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      // fillColor: backgroundColor2,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                    ),
                    // decoration: ShapeDecoration(),
                    hint: const Text('গ্রুপ নির্বাচন করুন'),
                    // value: state.farmers.first,
                    items: snapshot.data!.farmers
                        .map<DropdownMenuItem<GroupFieldEntity>>(
                            (GroupFieldEntity value) {
                      return DropdownMenuItem<GroupFieldEntity>(
                        // alignment: Alignment.center,
                        value: value,
                        child: Text(value.farmer_group_name),
                      );
                    }).toList(),
                    onChanged: (GroupFieldEntity? val) async {
                      final agriAdvisory =
                          context.read<AgriAdvisoryBloc>().state;
                      if (agriAdvisory is AgriAdvisoryInitial && val != null) {
                        agriAdvisory.groupID.text = val.farmer_group_id;
                      }
                      final loginState = context.read<LoginBloc>().state;
                      if (loginState is LoginSuccess) {
                        await showModalBottomSheet(
                          context: context,
                          builder: (context) => FutureBuilder<Object>(
                            future: groupDetailRepoImpl.getGroupDetails(
                              loginState.successLoginEntity.token,
                              val!.farmer_group_id,
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  ConnectionState.done ==
                                      snapshot.connectionState) {
                                final data = snapshot.data!
                                    as Result<GroupDetailEntity, Exception>;
                                final value2 = switch (data) {
                                  Success(data: final succ) => succ,
                                  ServerFailor(error: final err) => err,
                                };

                                if (value2 is GroupDetailEntity) {
                                  return SelectFarmerList(
                                    farmers: value2.farmer_list,
                                    // farmers: [],
                                  );
                                } else {
                                  return const Center(
                                    child: Text('No Group Members Found'),
                                  );
                                }
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: PrimaryLoadingIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return const Center(
                                  child: Text('No Members Found'),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        );
                      }
                    },
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: PrimaryLoadingIndicator(),
                );
              }
              return const Text('কোনো গ্রুপ পাওয়া যায় নি');
            },
          )
        else
          BlocConsumer<MyFarmerBloc, MyFarmerState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is MyFarmerFailed) {
                return const Center(child: Text('No Group Exists'));
              } else if (state is MyFarmerSuccess) {}
              return const SizedBox.shrink();
            },
          ),
      ],
    );
  }
}
