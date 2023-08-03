import 'package:deshifarmer/data/datasources/local/location_db/dist_db.dart';
import 'package:deshifarmer/data/datasources/local/location_db/division_db.dart';
import 'package:deshifarmer/data/datasources/local/location_db/upozilla_db.dart';
import 'package:deshifarmer/data/models/add_farmer_model.dart';
import 'package:deshifarmer/presentation/blocs/farmer_api/add_farmer_api_bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/add_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
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
              content: const Text('Failed to add a farmer'),
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
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.green[600]),
                  ),
                  onPressed: () {
                    final formState = context.read<AddFarmerBloc>().state;

                    final loginState = context.read<LoginBloc>().state;
                    if (formState is AddFarmerInitial) {
                      // print(formState.);
                      final farmerModel = AddFarmerModel(
                        govtFarmerID: formState.farmerGovtIDController.text,
                        nid: formState.farmerNIDController.text,
                        firstName: formState.firstNameController.text,
                        lastName: formState.lastNameController.text,
                        fathersName: formState.farmerFatherController.text,
                        phone: formState.farmerPhoneController.text,
                        isMarried:
                            formState.farmerRelationalStatusController.text ==
                                        'true' ||
                                    formState.farmerRelationalStatusController
                                        .text.isEmpty
                                ? '1'
                                : '0',
                        gender: formState.farmerGenderController.text.isEmpty
                            ? 'Male'
                            : formState.farmerGenderController.text,
                        dateOfBirth:
                            DateTime.parse(formState.dobController.text),
                        address: formState.farmerAddressController.text,
                        village: formState.farmerVillageController.text,
                        union: formState.farmerUnionController.text,
                        upazila:
                            formState.farmerUpozillaController.text.isNotEmpty
                                ? formState.farmerUpozillaController.text
                                : upzillaDatabase.first.id,
                        // upazila: int.parse(state.farmerUpozillaController.text),
                        district: formState.farmerDistController.text.isNotEmpty
                            ? formState.farmerDistController.text
                            : distDatabase.first.id,
                        division:
                            formState.farmerDivisionController.text.isEmpty
                                ? divisionDatabase.first.id
                                : formState.farmerDivisionController.text,
                        residentType:
                            formState.farmerLivingTypeController.text.isEmpty
                                ? formState.farmerLivingTypeController.text ==
                                        'Own (নিজের বাড়ি)'
                                    ? 'own'
                                    : 'ranted'
                                : formState.farmerLivingTypeController.text,
                        familyMember:
                            formState.farmerFamilyMembersController.text.isEmpty
                                ? '0'
                                : formState.farmerFamilyMembersController.text,
                        numberOfChildren:
                            formState.farmerChildrenController.text,
                        yearlyIncome: formState.farmerIncomeController.text,
                        yearOfStayIn: formState.farmerLivingYearController.text,
                        // yearOfStayIn:
                        //     double.parse(state.farmerLivingYearController.text),
                        groupId: formState.farmerGroupIDController.text,
                        farmArea: formState.farmerQtLandController.text,
                        farmType:
                            formState.farmerLandTypeController.text.isEmpty
                                ? formState.farmerLandTypeController.text ==
                                        'Own (নিজস্ব)'
                                    ? 'Own'
                                    : 'Lease'
                                : formState.farmerLandTypeController.text,
                        bankDetails: <String, String>{
                          'bank_name': formState.farmerBankNameController.text,
                          'branch_name':
                              formState.farmerBranchNameController.text,
                          'account_number':
                              formState.farmerBankAccountNumberController.text,
                        },
                        mfsAccount: <String, String>{
                          'mfs_type': formState
                                  .farmerMFSAccountTypeController.text.isEmpty
                              ? 'বিকাশ'
                              : formState.farmerMFSAccountTypeController.text,
                          'mfs_account':
                              formState.farmerMFSAccountNumberController.text,
                        },
                        currentProducingCrop:
                            formState.farmerCurrentProducingCorpController.text,
                        focusedCrop: formState.farmerFocusedCorpController.text,
                        image: formState.farmerImageController.text,
                        farmerType: '',
                      );
                      print(
                          '${farmerModel.dateOfBirth.year}-${farmerModel.dateOfBirth.month}-${farmerModel.dateOfBirth.day}',);
                      // print(DateFormat.yM(farmerModel.dateOfBirth));

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
                        'current_producing_crop':
                            farmerModel.currentProducingCrop.toString(), //JSON
                        'focused_crop':
                            farmerModel.focusedCrop.toString(), // JSON
                        // 'farm_id': farmerModel.farmId.toString(),
                        'year_of_stay_in': farmerModel.yearOfStayIn,
                      };
                      // testD.forEach((key, value) {
                      //   print('$key : $value');
                      // });
                      // print(testD);
                      // debugPrint(testD.toString());
                      // if (state.farmerChildrenController.text.isEmpty) {}

                      // print(farmerModel);
                      if (loginState is LoginSuccess) {
                        // print(loginState.successLoginEntity.token);
                        context.read<AddFarmerApiBloc>().add(
                              AddFarmerBtnPressEvent(
                                farmerModel: farmerModel,
                                token: loginState.successLoginEntity.token,
                              ),
                            );
                      }
                    }
                  },
                  child: const Text(
                    'কৃষক যোগ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
        );
      },
    );
  }
}
