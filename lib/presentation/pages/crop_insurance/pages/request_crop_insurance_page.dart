import 'package:deshifarmer/presentation/pages/crop_insurance/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/crop_insurance/components/farmer_list_compo.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

class RequestCropInsurance extends StatelessWidget {
  const RequestCropInsurance({super.key});

  @override
  Widget build(BuildContext context) {
    final cropInsuranceState = context.read<CropInsuranceBloc>().state;

    final loginState = context.read<LoginBloc>().state;
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        title: const Text('নতুন ইন্সুরেন্স রিকোয়েস্ট ফর্ম '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: ListView(
          children: [
            // const Padding(
            //   padding: EdgeInsets.symmetric(
            //     // horizontal: 10,
            //     vertical: 20,
            //   ),
            //   child: Text(
            //     'নতুন ইন্সুরেন্স রিকোয়েস্ট ফর্ম ',
            //     style: TextStyle(
            //       fontSize: 18,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),
            const Text(
              'কৃষকের বিবরণ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(8),
              child: FarmerListDropDownInsurance(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 8,
              ),
              child: DropdownButtonFormField<String>(
                isDense: false,
                dropdownColor: backgroundColor2,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    // vertical: 5,
                  ),
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
                  // fillColor: backgroundColor2,
                ),
                // decoration: ShapeDecoration(),
                // itemHeight: 300,
                elevation: 16,
                value: havestPeriod.first,
                items: havestPeriod.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.center,
                    value: value,
                    child: ListTile(
                      title: Text(value),
                    ),
                  );
                }).toList(),

                onChanged: (String? val) {
                  if (cropInsuranceState is CropInsuranceInitial) {
                    // if (val != null) {
                    //   if (loginState is LoginSuccess) {
                    //     debugPrint('log in state good. Calling FarmEvent');
                    //     // context.read<FarmerFetchFarmBloc>().add(
                    //     //       FramFetchEvent(
                    //     //         token: loginState.successLoginEntity.token,
                    //     //         farmerID: val.farmer_id!,
                    //     //       ),
                    //     //     );
                    //   }
                    // }
                    if (val != null) {
                      cropInsuranceState.harvestPeriod.text = val;
                    }
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: cropInsuranceState is CropInsuranceInitial
                    ? cropInsuranceState.phoneNumber
                    : null,
                keyboardType: TextInputType.phone,
                maxLength: 11,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  // hintText: 'Phone no.',
                  hintText: 'ফোন নম্বর',
                  hintStyle: TextStyle(
                      // color: Colors.black,
                      ),
                  // fillColor: backgroundColor2,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  filled: true,
                ),
              ),
            ),

            /// note for the insurance componay

            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: cropInsuranceState is CropInsuranceInitial
                    ? cropInsuranceState.notes
                    : null,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'বীমা কোম্পানির জন্য নোট',
                  // hintText: 'Notes for the insurance company',
                  hintStyle: TextStyle(
                      // color: Colors.black,
                      ),
                  // fillColor: backgroundColor2,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  filled: true,
                ),
              ),
            ),

            ///
            const SizedBox(height: 20),
            SecondayButtonGreen(
                onpress: () {
                  debugPrint('request crop called .............\n');
                  if (cropInsuranceState is CropInsuranceInitial) {
                    debugPrint({
                      'farmerid': cropInsuranceState.farmerID.text,
                      'harvest period': cropInsuranceState.harvestPeriod.text,
                      'phone': cropInsuranceState.phoneNumber.text,
                      'notes': cropInsuranceState.notes.text,
                    }.toString(),);
                  }
                },
                title: 'সাবমিট করুন ',),
          ],
        ),
      ),
    );
  }
}

List<String> havestPeriod = [
  // 'Harvest Period',
  'ফসল কাটার সময়কাল',
  '1-2 Months',
  '3-4 Months',
  '5-6 Months',
];
