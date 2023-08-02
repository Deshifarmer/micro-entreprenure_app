import 'package:deshifarmer/data/models/add_farmer_model.dart';
import 'package:deshifarmer/presentation/blocs/farmer_api/add_farmer_api_bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/add_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:flutter/material.dart';

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
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: state is AddFarmerAPILoadingState
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.green[600]),
                  ),
                  onPressed: () {
                    var formState = context.read<AddFarmerBloc>().state;

                    final loginState = context.read<LoginBloc>().state;
                    if (formState is AddFarmerInitial) {
                      final farmerModel = AddFarmerModel(
                        nid: int.parse(formState.farmerNIDController.text),
                        firstName: formState.firstNameController.text,
                        lastName: formState.lastNameController.text,
                        fathersName: formState.farmerFatherController.text,
                        phone: formState.farmerPhoneController.text,
                        isMarried:
                            formState.farmerRelationalStatusController.text ==
                                    'true'
                                ? true
                                : false,
                        gender: formState.farmerGenderController.text,
                        dateOfBirth: DateTime.now(),
                        address: formState.farmerAddressController.text,
                        village: formState.farmerVillageController.text,
                        union: formState.farmerUnionController.text,
                        upazila: 2,
                        // upazila: int.parse(state.farmerUpozillaController.text),
                        district: 2,
                        division: 2,
                        residentType: formState.farmerLivingTypeController.text,
                        familyMember: 23,
                        // familyMember:
                        //     int.parse(state.farmerFamilyMembersController.text),
                        // numberOfChildren: int.parse(
                        //   formState.farmerChildrenController.text,
                        // ),
                        numberOfChildren: 9,
                        yearlyIncome:
                            int.parse(formState.farmerIncomeController.text),
                        yearOfStayIn: 2340,
                        // yearOfStayIn:
                        //     double.parse(state.farmerLivingYearController.text),
                        groupId: formState.farmerGroupIDController.text,
                        farmArea: formState.farmerQtLandController.text,
                        farmType: formState.farmerLandTypeController.text,
                        bankDetails: {},
                        mfsAccount: {},
                        currentProducingCrop: {},
                        focusedCrop: {},
                        image: formState.farmerImageController.text,
                        farmerType: '',
                      );

                      print('debugging -> DO NOT DDDDDDDDDDD');
                      final _testD = {
                        'nid': int.parse(formState.farmerNIDController.text),
                        'firstName': formState.firstNameController.text,
                        'lastName': formState.lastNameController.text,
                        'fathersName': formState.farmerFatherController.text,
                        'phone': formState.farmerPhoneController.text,
                        'isMarried':
                            formState.farmerRelationalStatusController.text ==
                                    'true'
                                ? true
                                : false,
                        'gender': formState.farmerGenderController.text,
                        'dateOfBirth': DateTime.now(),
                        'address': formState.farmerAddressController.text,
                        'village': formState.farmerVillageController.text,
                        'union': formState.farmerUnionController.text,
                        'upazila': 2,
                        // upazila: int.parse(state.farmerUpozillaController.text),
                        'district': 2,
                        'division': 2,
                        'residentType':
                            formState.farmerLivingTypeController.text,
                        'familyMember': 23,
                        // familyMember:
                        //     int.parse(state.farmerFamilyMembersController.text),
                        // numberOfChildren: int.parse(
                        //   formState.farmerChildrenController.text,
                        // ),
                        'numberOfChildren': 9,
                        'yearlyIncome':
                            int.parse(formState.farmerIncomeController.text),
                        'yearOfStayIn': 2340,
                        // yearOfStayIn:
                        //     double.parse(state.farmerLivingYearController.text),
                        'groupId': formState.farmerGroupIDController.text,
                        'farmArea': formState.farmerQtLandController.text,
                        'farmType': formState.farmerLandTypeController.text,
                        'bankDetails': {},
                        'mfsAccount': {},
                        'currentProducingCrop': {},
                        'focusedCrop': {},
                        'image': formState.farmerImageController.text,
                        'farmerType': '',
                      };
                      print(_testD);
                      // if (state.farmerChildrenController.text.isEmpty) {}

                      print(farmerModel);
                      if (loginState is LoginSuccess) {
                        print(loginState.successLoginEntity.token);
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
