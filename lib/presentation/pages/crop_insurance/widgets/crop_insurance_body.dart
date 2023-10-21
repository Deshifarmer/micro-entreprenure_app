import 'package:deshifarmer/presentation/pages/crop_insurance/bloc/bloc.dart';
import 'package:deshifarmer/presentation/shapes/insurance_shape.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

/// {@template crop_insurance_body}
/// Body of the CropInsurancePage.
///
/// Add what it does
/// {@endtemplate}
class CropInsuranceBody extends StatelessWidget {
  /// {@macro crop_insurance_body}
  const CropInsuranceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CropInsuranceBloc, CropInsuranceState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'কৃষি বীমা কি ?',
                        // 'What is Crop Insurance',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: priceBoxColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 1.5,
                          child: const Text(
                            '''কৃষি বীমা একটি বীমা প্রক্রিয়া যা কৃষি উৎপাদনের জন্য কৃষকদের আর্থিক সুরক্ষা প্রদান করে। এটি প্রাথমিকভাবে কৃষকদের জীবন ও আয়ের জন্য একটি আর্থিক সুরক্ষা উপায় তৈরি করতে সাহায্য করে, যাতে যদি কৃষি উৎপাদন কোন যত্ন নেয় বা কোন কারণে ক্ষতি হয়, তবুও কৃষকদের আয় বাঁচে এবং তাদের আর্থিক অসুবিধা কমে।''',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              // letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
// InsuranceShape
                  Expanded(
                    child: CustomPaint(
                      painter: InsuranceShape(),
                      size: const Size(100, 100),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Text(
                'বীমা কি কভার করে ?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: priceBoxColor,
                ),
              ),
              const Text(
                '* Localised calamities: It covers localised calamities and risks like hailstorm, landslide affecting isolated farms in the notified area',
              ),
              const Text(
                '* Sowing/Planting/Germination risk: Any problem in planting or sowing because of deficit rainfall or adverse seasonal conditions',
              ),
              const Text(
                '* Standing crop loss: Comprehensive risk insurance to cover yield losses because of non-preventable risks, such as dry spells, flood, hailstorm, cyclone, typhoon',
              ),
              const Text(
                '* Post-harvest losses: It covers losses for up to a maximum period of two weeks from harvesting',
              ),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
