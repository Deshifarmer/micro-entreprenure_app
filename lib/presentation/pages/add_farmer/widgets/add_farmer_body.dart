import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/children_form_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/famer_focused_corp_multi.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/family_member_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/farmer_dob_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/farmer_gender_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/farmer_profile_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/farmer_village_address.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/field_form_type_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/group_fields_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/living_type_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/living_year_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/components/m_bank_ac_type_field.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/widgets/add_farmer_btn.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

/// {@template add_farmer_body}
/// Body of the AddFarmerPage.
///
/// Add what it does

class AddFarmerBody extends StatelessWidget {
  /// {@macro add_farmer_body}
  const AddFarmerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFarmerBloc, AddFarmerState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              ///* picture upload
              const FarmerProfilePicUpload(),
              // FarmerPicUploadStateCompo(),

              if (state is AddFarmerInitial) ...[
                Text(
                  'কৃষকের ব্যাক্তিগত তথ্য',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: priceBoxColor,
                      ),
                ),

                ///! first name
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: state.firstNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'নামের প্রথম অংশ',
                      hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                      filled: true,
                    ),
                  ),
                ),

                ///* last name
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    controller: state.lastNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'নামের শেষ অংশ',
                      hintText: 'কৃষকের নামের শেষ অংশ লিখুন',
                      filled: true,
                    ),
                  ),
                ),

                ///* dob field
                const FarmarDOB(),

                ///* father's name (farmar)

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: state.farmerFatherController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'কৃষকের পিতার নাম',
                      filled: true,
                    ),
                  ),
                ),

                ///* nid
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: state.farmerNIDController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'কৃষকের এনআইডি নম্বর',
                      hintText: 'কৃষকের এনআইডি নম্বর লিখুন',
                      filled: true,
                    ),
                  ),
                ),

                ///* phone number
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: state.farmerPhoneController,
                    maxLength: 11,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'কৃষকের ফোন নম্বর',
                      hintText: 'কৃষকের ফোন নম্বর লিখুন',
                      filled: true,
                    ),
                  ),
                ),
                // PhoneWidget(),

                ///* gender & marital Status
                const GenderField(),
                const MaritalStatusField(),
                // const Row(
                //   children: [
                //     Expanded(child: GenderField()),
                //     Expanded(child: MaritalStatusField()),
                //   ],
                // ),
                // SizedBox(
                //   height: getProportionateScreenHeight(15),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(15),
                  ),
                  child: Text(
                    'কৃষকের ঠিকানা',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: priceBoxColor,
                        ),
                  ),
                ),
                const FarmerVillageAddress(),
                // DistFormField(),
                // DivisionFormField(),
                // const UpzillaFormField(),

                ///* union
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: state.farmerUnionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'ইউনিয়ন',
                      // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                      filled: true,
                    ),
                  ),
                ),

                ///* village name
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: state.farmerVillageController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'গ্রামের নাম',
                      // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                      filled: true,
                    ),
                  ),
                ),

                ///* address
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: state.farmerAddressController,
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      labelText: 'ঠিকানা',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      // hintText: 'কৃষকের নামের প্রথম অংশ লিখুন',
                      filled: true,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(15),
                  ),
                  child: Text(
                    'কৃষকের আরও তথ্য',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: priceBoxColor,
                        ),
                  ),
                ),
                const ChildrenFormField(), const FamilyMemberFormField(),

                ///* how long is he/she living there
                const LivingYearFormField(),

                ///* yearly income
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: state.farmerIncomeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'কৃষকের বার্ষিক আয়',
                      filled: true,
                    ),
                  ),
                ),

                ///* farmar id (leave blank)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: state.farmerGovtIDController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'সরকারি কৃষক আইডি (না থাকলে ফাকা রাখুন)',
                      filled: true,
                    ),
                  ),
                ),

                ///* living house type (own/rantal)

                ///* land type
                // const Row(
                //   children: [
                //     Expanded(child: FieldTypeFormField()),
                //     Expanded(child: LivingTypeFormField()),
                //   ],
                // ),
                const FieldTypeFormField(),
                const LivingTypeFormField(),

                ///* land messure
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: state.farmerQtLandController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'জমির পরিমাণ',
                      filled: true,
                    ),
                  ),
                ),

                ///! Expansion tile of farmer Bank account
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.green[200],
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  child: ExpansionTile(
                    title: const Text('কৃষকের ব্যাংক একাউন্ট রয়েছে'),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: state.farmerBankNameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(10),
                            labelText: 'ব্যাংকের নাম',
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: state.farmerBranchNameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(10),
                            labelText: 'শাখার নাম',
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: state.farmerBankAccountNumberController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(10),
                            labelText: 'একাউন্ট নাম্বার',
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///* bkash/nogod/mfs

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    //color: Colors.green[200],
                  ),
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  child: ExpansionTile(
                    title: const Text(
                        'বিকাশ /নগদ/উপায় বা অন্যান্য MFS একাউন্ট রয়েছে',),
                    children: [
                      const MBankAccountType(),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: state.farmerMFSAccountNumberController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(10),
                            labelText: 'এম-এফএস একাউন্ট নম্বর',
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              //! Group fields from CUBIT

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //color: Colors.green[200],
                ),
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                child: ExpansionTile(
                  onExpansionChanged: (value) {
                    final loginState = context.read<LoginBloc>().state;
                    final token = loginState is LoginSuccess
                        ? loginState.successLoginEntity.token
                        : '';

                    if (value) {
                      // GetGroupCubit
                      context.read<GetGroupCubit>().addAllGroupFields(token);
                    }
                    // print('value -> isOpen $value');
                  },
                  title: const Text(
                    'গ্রুপে যোগ করতে চাইলে এইখানে ক্লিক করুন এবং গ্রুপ সিলেক্ট করুন',
                  ),
                  children: const [
                    GroupSelector(),
                  ],
                ),
              ),

              //! a multi select field
              const FarmerCurrentProducingCorp(),

              // if (state is AddFarmerInitial)
              const FarmerFocusedCorpMulti(),

              ///* A submit Button
              const AddFarmerButton(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
            ],
          ),
        );
      },
    );
  }
}
