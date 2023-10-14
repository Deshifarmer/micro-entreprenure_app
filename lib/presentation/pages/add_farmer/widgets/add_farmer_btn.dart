import 'package:deshifarmer/data/models/add_farmer_model.dart';
import 'package:deshifarmer/presentation/blocs/farmer_api/add_farmer_api_bloc.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/add_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AddFarmerButton extends StatelessWidget {
  const AddFarmerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFarmerApiBloc, AddFarmerApiState>(
      listener: (context, state) {
        if (state is AddFarmerAPIErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.red[700],
              content: Text(state.message),
            ),
          );
        }
        if (state is AddFarmerAPISuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green[700],
              content: const Text('Successfully farmer Added'),
            ),
          );
          Future.delayed(1.seconds, () => Navigator.pop(context));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: state is AddFarmerAPILoadingState
              ? const Center(
                  child: PrimaryLoadingIndicator(),
                )
              : SecondayButtonGreen(
                  onpress: () {
                    final formState = context.read<AddFarmerBloc>().state;
                    final loginState = context.read<LoginBloc>().state;

                    if (formState is AddFarmerInitial) {
                      try {
                        if (formState.firstNameController.text.isEmpty) {
                          /// show a snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('প্রথম নাম প্রদান করুন'),
                          );
                        } else if (formState.lastNameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('শেষ নাম প্রদান করুন'),
                          );
                        } else if (formState.farmerNIDController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('জাতীয় পরিচয় পত্র নম্বর প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerFatherController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('পিতার নাম প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerPhoneController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('ফোন নম্বর প্রদান করুন'),
                          );
                        } else if (formState.farmerPhoneController.text.length <
                            11) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('ফোন নম্বর ঠিক করুন'),
                          );
                        } else if (formState
                            .farmerRelationalStatusController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('বৈবাহিক অবস্থা প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerGenderController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('লিঙ্গ প্রদান করুন'),
                          );
                        }

                        /// check if the dob is 18 years old
                        else if (formState.dobController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('জন্ম তারিখ প্রদান করুন'),
                          );
                        } else if (DateTime.now()
                                .difference(
                                  DateTime.parse(
                                    formState.dobController.text,
                                  ),
                                )
                                .inDays <
                            6570) {
                          debugPrint(
                            (DateTime.now()
                                        .difference(
                                          DateTime.parse(
                                            formState.dobController.text,
                                          ),
                                        )
                                        .inDays <
                                    (17 * 365))
                                .toString(),
                          );

                          /// 17 years in days
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('আপনার বয়স ১৭ বছরের কম হতে পারে না'),
                          );
                        } else if (formState
                            .farmerAddressController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('ঠিকানা প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerVillageController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('গ্রাম প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerUpozillaController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('উপজেলা প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerUnionController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('ইউনিয়ন প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerDistController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('জেলা প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerLivingTypeController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('বাসিন্দা প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerFamilyMembersController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('পরিবারের সদস্য সংখ্যা প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerChildrenController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('সন্তানের সংখ্যা প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerIncomeController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('বার্ষিক আয় প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerLivingYearController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('বসবাসের সময় প্রদান করুন'),
                          );
                        } else if (formState
                            .farmerImageController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            errorSnackBar('ছবি আপলোড করুন'),
                          );
                        } else {
                          // /// check if the user dob is greater then 17 or not
                          // if (DateTime.now()
                          //         .difference(DateTime.parse(
                          //             formState.dobController.text))
                          //         .inDays <
                          //     6570) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     errorSnackBar('আপনার বয়স ১৮ বছরের কম হতে পারে না'),
                          //   );
                          // }
                          // debugPrint(formState.);
                          final farmerModel = AddFarmerModel(
                            govtFarmerID: formState.farmerGovtIDController.text,
                            nid: formState.farmerNIDController.text,
                            firstName: formState.firstNameController.text,
                            lastName: formState.lastNameController.text,
                            fathersName: formState.farmerFatherController.text,
                            phone: formState.farmerPhoneController.text,
                            isMarried:
                                formState.farmerRelationalStatusController.text,
                            gender: formState.farmerGenderController.text,
                            dateOfBirth:
                                DateTime.parse(formState.dobController.text),
                            address: formState.farmerAddressController.text,
                            village: formState.farmerVillageController.text,
                            union: formState.farmerUnionController.text,
                            upazila: formState.farmerUpozillaController.text,
                            // upazila: int.parse(state.farmerUpozillaController.text),
                            district: formState.farmerDistController.text,
                            division: formState.farmerDivisionController.text,
                            residentType:
                                formState.farmerLivingTypeController.text,
                            familyMember:
                                formState.farmerFamilyMembersController.text,
                            numberOfChildren:
                                formState.farmerChildrenController.text,
                            yearlyIncome: formState.farmerIncomeController.text,
                            yearOfStayIn:
                                formState.farmerLivingYearController.text,
                            // yearOfStayIn:
                            //     double.parse(state.farmerLivingYearController.text),
                            groupId: formState.farmerGroupIDController.text,
                            farmArea: formState.farmerQtLandController.text,
                            farmType: formState.farmerLandTypeController.text,
                            bankDetails: <String, String>{
                              'bank_name':
                                  formState.farmerBankNameController.text,
                              'branch_name':
                                  formState.farmerBranchNameController.text,
                              'account_number': formState
                                  .farmerBankAccountNumberController.text,
                            },
                            mfsAccount: <String, String>{
                              'mfs_type':
                                  formState.farmerMFSAccountTypeController.text,
                              'mfs_account': formState
                                  .farmerMFSAccountNumberController.text,
                            },
                            currentProducingCrop: formState
                                .farmerCurrentProducingCorpController.text,
                            focusedCrop:
                                formState.farmerFocusedCorpController.text,
                            image: formState.farmerImageController.text,
                            farmerType: '',
                          );

                          // debugPrint(DateFormat.yM(farmerModel.dateOfBirth));
                          if (loginState is LoginSuccess) {
                            context.read<AddFarmerApiBloc>().add(
                                  AddFarmerBtnPressEvent(
                                    farmerModel: farmerModel,
                                    token: loginState.successLoginEntity.token,
                                  ),
                                );
                            context.read<UserProfileBloc>().add(
                                  GetUserProfileEvent(
                                    token: loginState.successLoginEntity.token,
                                  ),
                                );
                          }
                          final testD = {
                            'farmer_type': '1',
                            // 'onboard_by': farmerModel.onboardBy ?? '', //! NOT NEEDED
                            'nid': farmerModel.nid,
                            'gov_farmer_id': farmerModel.govtFarmerID
                                .toString(), //? check if govt id or DO NOT ADD THE FIELD
                            'first_name': farmerModel.firstName,
                            'last_name': farmerModel.lastName,
                            'fathers_name': farmerModel.fathersName,
                            'phone': farmerModel.phone,
                            'is_married': farmerModel.isMarried,
                            'gender': farmerModel.gender,
                            'date_of_birth':
                                '${farmerModel.dateOfBirth.year}-${farmerModel.dateOfBirth.month}-${farmerModel.dateOfBirth.day}',
                            'address': farmerModel.address,
                            'village': farmerModel.village,
                            'union': farmerModel.union,
                            'upazila': farmerModel.upazila,
                            'district': farmerModel.district,
                            'division': farmerModel.division,
                            // 'resident_type': 'Rental', //* OWN/Rental
                            'resident_type':
                                farmerModel.residentType, //* OWN/Rental
                            'family_member': farmerModel.familyMember,
                            'number_of_children': farmerModel.numberOfChildren,
                            'yearly_income': farmerModel.yearlyIncome,
                            'group_id': farmerModel.groupId.toString(),
                            'farm_area': farmerModel.farmArea.toString(),
                            'farm_type': farmerModel.farmType.toString(),
                            'bank_details':
                                farmerModel.bankDetails.toString(), //JSON
                            'mfs_account':
                                farmerModel.mfsAccount.toString(), // JSON
                            'current_producing_crop': farmerModel
                                .currentProducingCrop
                                .toString(), //JSON
                            'focused_crop':
                                farmerModel.focusedCrop.toString(), // JSON
                            // 'farm_id': farmerModel.farmId.toString(),
                            'year_of_stay_in': farmerModel.yearOfStayIn,
                          };
                          // debugPrint(testD);
                          testD.forEach((key, value) {
                            debugPrint('$key : $value');
                          });
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(errorSnackBar(e.toString()));
                      }

                      // debugdebugPrint(testD.toString());
                      // if (state.farmerChildrenController.text.isEmpty) {}

                      // debugPrint(farmerModel);
                    }
                  },
                  title: 'কৃষক যোগ',
                ),
        );
      },
    );
  }
}
