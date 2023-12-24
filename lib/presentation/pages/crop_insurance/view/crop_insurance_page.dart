import 'package:deshifarmer/presentation/pages/crop_insurance/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/crop_insurance/pages/myrequest_crop_insurance.dart';
import 'package:deshifarmer/presentation/pages/crop_insurance/widgets/crop_insurance_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

/// {@template crop_insurance_page}
/// A description for CropInsurancePage
/// {@endtemplate}
class CropInsurancePage extends StatelessWidget {
  /// {@macro crop_insurance_page}
  const CropInsurancePage({super.key});

  /// The static route for CropInsurancePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const CropInsurancePage(),);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CropInsuranceBloc(),
      child: Scaffold(
          extendBody: true,
          backgroundColor: backgroundColor2,
          appBar: AppBar(
            backgroundColor: backgroundColor2,
          ),
          body: const CropInsuranceView(),
          bottomNavigationBar: SecondayButtonGreen(
              btnColor: priceBoxColor,
              onpress: () {
// MyRequestCropInsurance
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => const MyRequestCropInsurance(),),);
              },
              title: 'Continue',),),
    );
  }
}

/// {@template crop_insurance_view}
/// Displays the Body of CropInsuranceView
/// {@endtemplate}
class CropInsuranceView extends StatelessWidget {
  /// {@macro crop_insurance_view}
  const CropInsuranceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CropInsuranceBody();
  }
}
