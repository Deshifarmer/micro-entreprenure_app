import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/data/datasources/local/corps/corps_db.dart';
import 'package:deshifarmer/data/models/add_farm_model.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/components/farm_pic_upload_field.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/components/farmer_creationfield.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/components/select_farmer_for_farm_paginate.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:deshifarmer/services/cubit/select_pagi_farmer/select_paginated_farmer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

/// {@template farmadd_form_body}
/// Body of the FarmaddFormPage.
///
/// Add what it does
/// {@endtemplate}
class FarmaddFormBody extends StatelessWidget {
  /// {@macro farmadd_form_body}
  const FarmaddFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    // AddFarmerBloc
    // var farmAddState = context.read<FarmaddFormBloc>().state;
    return BlocConsumer<FarmaddFormBloc, FarmaddFormState>(
      listener: (context, state) {
        if (state is FarmAddingFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text('Farm Failed to Add'),
            ),
          );
        }
        if (state is FarmAddingSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: secondaryColor,
              content: Text('Farm Successfully Added'),
            ),
          );
          // Navigator.pop(context);
        }
      },
      builder: (context, farmAddState) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            cacheExtent: 2000,
            children: [
              //! Farm Reg Form Fields
              // AddFarmerBloc
              if (farmAddState is FarmaddFormInitial) ...[
                Text(
                  'কৃষক নির্বাচন করুন',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: primaryColor,
                      ),
                ),
                //! A dropdown of all farmers which has created by the USER
                /*
                BlocConsumer<MyFarmerBloc, MyFarmerState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is MyFarmerInitial) {
                      return const Center(
                        child: PrimaryLoadingIndicator(),
                      );
                    } else if (state is MyFarmerFailed) {
                      return const Center(
                        child: Text(
                          'Fam Fetched Failed',
                        ),
                      );
                    } else if (state is MyFarmerSuccess) {
                      
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: DropdownButtonFormField<FarmerEntity>(
                          isDense: false,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          isExpanded: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            label: Text('কৃষক নির্বাচন করুন'),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none,
                              gapPadding: 10,
                            ),
                            filled: true,
                          ),
                          // decoration: ShapeDecoration(),
                          // itemHeight: 300,
                          elevation: 16,
                          items: state.allFarmerListResp.farmers
                              .toSet()
                              .toList()
                              .map<DropdownMenuItem<FarmerEntity>>((value) {
                            return DropdownMenuItem<FarmerEntity>(
                              alignment: Alignment.center,
                              value: value,
                              child: ListTile(
                                leading: value.image!.isEmpty
                                    ? null
                                    : ClipRRect(
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
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress,) =>
                                              Center(
                                            child: CircularProgressIndicator(
                                              value: downloadProgress.progress,
                                              color: Colors.green[600],
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                title: Text(value.full_name ?? ''),
                                subtitle: Text(value.phone ?? ''),
                              ),
                            );
                          }).toList(),

                          onChanged: (FarmerEntity? val) {
                            if (val != null) {
                              farmAddState.farmerID.text = val.farmer_id!;
                            }
                          },
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                */
                // SelectPaginatedFarmerCubit
                BlocConsumer<SelectPaginatedFarmerCubit,
                    SelectPaginatedFarmerState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is SelectPaginatedFarmer) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () async {
                            // SelectFarmerPaginateForFarm
                            await showModalBottomSheet(
                              context: context,
                              builder: (c) {
                                return SelectFarmerPaginateForFarm();
                              },
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.white,
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: checkDomain(
                                Strings.getServerOrLocal(
                                  ServerOrLocal.server,
                                ),
                              )
                                  ? dummyImage
                                  : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${state.farmerEntity.image}',
                              height: 50,
                              width: 50,
                              progressIndicatorBuilder: (
                                context,
                                url,
                                downloadProgress,
                              ) =>
                                  Center(
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: Colors.green[600],
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          title: Text(state.farmerEntity.full_name ?? ''),
                          subtitle: Text(state.farmerEntity.phone ?? ''),
                          trailing: Column(
                            children: [
                              if (state.farmerEntity.usaid_id != null)
                                Text(
                                  state.farmerEntity.usaid_id ?? '',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              if (state.farmerEntity.farmer_id != null)
                                Text(
                                  ' (${state.farmerEntity.farmer_id})',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: () async {
                          // SelectFarmerPaginateForFarm
                          await showModalBottomSheet(
                              context: context,
                              builder: (c) {
                                return SelectFarmerPaginateForFarm();
                              });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tileColor: Colors.white,
                        title: const Text('কৃষক নির্বাচন করুন'),
                      ),
                    );
                  },
                ),
                Text(
                  'ফার্মের বিবরণ',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: primaryColor,
                      ),
                ),
                //! farm name
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.name,
                    controller: farmAddState.farmName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      labelText: 'ফার্ম নাম',
                      labelStyle: TextStyle(color: primaryColor),
                      hintText: 'ফার্ম নাম',
                      filled: true,
                    ),
                  ),
                ),
                //! farm addr
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    cursorColor: primaryColor,
                    maxLines: 3,
                    controller: farmAddState.farmLocation,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      labelText: 'ঠিকানা',
                      labelStyle: TextStyle(color: primaryColor),
                      hintText: 'ঠিকানা',
                      filled: true,
                    ),
                  ),
                ),
                //! union
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    cursorColor: primaryColor,
                    controller: farmAddState.farmUnion,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'ইউনিয়ন',
                      hintText: 'ইউনিয়ন',
                      labelStyle: TextStyle(color: primaryColor),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      filled: true,
                    ),
                  ),
                ),
                //! muza
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.name,
                    controller: farmAddState.farmMouzza,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: 'মৌজা',
                      labelStyle: TextStyle(color: primaryColor),
                      hintText: 'মৌজা',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      filled: true,
                    ),
                  ),
                ),
                //! land size
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.name,
                    controller: farmAddState.farmLength,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      labelText: 'জমির পরিমাপ',
                      labelStyle: TextStyle(color: primaryColor),
                      hintText: 'জমির পরিমাপ',
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      filled: true,
                    ),
                  ),
                ),
                //! farm creation date
                const FarmCreationDate(),

                //! farm area

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    keyboardType: TextInputType.name,
                    controller: farmAddState.farmArea,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      labelText: 'Farm Area',
                      labelStyle: TextStyle(color: primaryColor),
                      hintText: 'Farm Area',
                      filled: true,
                    ),
                  ),
                ),

                //! soil type
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: DropdownButtonFormField<String>(
                    isDense: false,
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    isExpanded: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      label: Text('মাটির ধরণ'),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gapPadding: 10,
                      ),
                      filled: true,
                    ),
                    // decoration: ShapeDecoration(),
                    // itemHeight: 300,
                    elevation: 16,
                    value: soilTypes.first,
                    items: soilTypes.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.center,
                        value: value,
                        child: ListTile(
                          title: Text(value),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? val) {
                      if (val != null) {
                        farmAddState.farmSoilType.text = val;
                      }
                    },
                  ),
                ),

                //! focused corp
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: MultiSelectDropDown(
                    // controller: _multiSelectController,
                    hint: 'প্রধান ফসল নির্বাচন',
                    // selectedOptions: vls,
                    // selectedOptions:state.farmerFocusedCorpController.text ,
                    chipConfig: ChipConfig(
                      wrapType: WrapType.wrap,
                      backgroundColor: Colors.green[400],
                    ),
                    selectedOptionTextColor: Colors.green,
                    options: cropsDatabase
                        .map((e) => ValueItem(label: e.name))
                        .toList(),
                    onOptionSelected: (selectedOptions) {
                      // debugPrint(
                      //     'multi select controller -> ${_multiSelectController.selectedOptions}');
                      final values = [];
                      // debugPrint(selectedOptions);
                      for (final vi in selectedOptions) {
                        // debugPrint(vi.label);
                        values.add(vi.label);
                      }

                      farmAddState.farmProducingCrop.text =
                          values.toSet().toString();
                    },
                    padding: const EdgeInsets.all(8),
                    dropdownHeight: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),

                //! farmer profile picccc upload
                const FarmerProfilePicUpload(),
              ] else
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/animations/farmer.json'),
                    const Text('ফার্ম যোগ করা হচ্ছে..........')
                        .animate(onPlay: (c) => c.repeat())
                        .shimmer(
                      colors: [
                        primaryColor,
                        primaryColor2,
                        priceBoxColor,
                      ],
                    ),
                  ],
                ),

              if (farmAddState is! FarmAddLoading)
                BlocBuilder<SelectPaginatedFarmerCubit,
                    SelectPaginatedFarmerState>(
                  builder: (context, state) {
                    return SecondayButtonGreen(
                      onpress: () async {
                        if (farmAddState is FarmaddFormInitial &&
                            state is SelectPaginatedFarmer) {
                          if (farmAddState.farmName.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar('Farm Name cannot be empty'),
                            );
                          } else if (farmAddState.farmLocation.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar('Farm Location Cannot be empty'),
                            );
                          } else if (farmAddState.farmUnion.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar('Union Cannot be empty'),
                            );
                          } else if (farmAddState.farmMouzza.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar('Mouzza Cannot be Empty'),
                            );
                          } else if (farmAddState.farmLength.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar('Farm Length Cannot be empty'),
                            );
                          } else if (farmAddState
                              .farmStartingDate.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar('Starting date cannot be empty'),
                            );
                          } else if (farmAddState.farmArea.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar('Farm Area cannot be empty'),
                            );
                          } else if (farmAddState
                              .farmProducingCrop.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar(
                                'Farm Producing Crop cannot be empty',
                              ),
                            );
                          } else if (farmAddState.farmSoilType.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar(
                                'Farm Soil Type cannot be empty',
                              ),
                            );
                          } else if (farmAddState.farmSoilType.text ==
                              soilTypes.first) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              errorSnackBar(
                                'Farm Soil Type cannot be empty',
                              ),
                            );
                          } else {
                            final farmModel = AddFarmModel(
                              farmerID: state.farmerEntity.farmer_id!,
                              farmName: farmAddState.farmName.text,
                              farmUnion: farmAddState.farmUnion.text,
                              farmLocation: farmAddState.farmLocation.text,
                              farmMouza: farmAddState.farmMouzza.text,
                              farmLength: farmAddState.farmLength.text,
                              farmSoilType:
                                  farmAddState.farmSoilType.text.isEmpty
                                      ? soilTypes.first
                                      : farmAddState.farmSoilType.text,
                              farmStartingDate:
                                  farmAddState.farmStartingDate.text,
                              farmProducingCrop:
                                  farmAddState.farmProducingCrop.text,
                              // farmProducingCrop
                              farmArea: farmAddState.farmArea.text,
                              images: farmAddState.images,
                            );
                            debugPrint({
                              'farmerID': state.farmerEntity.farmer_id,
                              'farmName': farmAddState.farmName.text,
                              'farmUnion': farmAddState.farmUnion.text,
                            }.toString());
                            final loginState = context.read<LoginBloc>().state;
                            if (loginState is LoginSuccess) {
                              context.read<FarmaddFormBloc>().add(
                                    AddFarmFormEvent(
                                      farmModel,
                                      loginState.successLoginEntity.token,
                                    ),
                                  );
                            }
                          }
                        }
                      },
                      title: 'ফার্ম যোগ ',
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
