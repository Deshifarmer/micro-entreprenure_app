import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/pages/farmer_profile/page/edit_farmer_info.dart';
import 'package:deshifarmer/presentation/pages/farmer_profile/widgets/farmer_profile_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A description for FarmerProfilePage
class FarmerProfilePage extends StatelessWidget {
  const FarmerProfilePage({
    required this.farmerProfilePage,
    super.key,
  });
  final FarmerEntity farmerProfilePage;

  /// The static route for FarmerProfilePage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: backgroundColor2,
        leading: IconButton(
          onPressed: () {
            // print(farmerProfilePage.full_name);
            Navigator.pop(context);
          },
          icon: const Icon(Icons.navigate_before),
        ),
        title: Text(farmerProfilePage.full_name ?? ''),
      ),
      body: FarmerProfileView(
        farmerProfilePage: farmerProfilePage,
      ),
      bottomNavigationBar: SecondayButtonGreen(
        onpress: () {
          // EditFarmerDetails(farmerProfilePage: farmerProfilePage);
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) =>
                  EditFarmerDetails(farmerProfilePage: farmerProfilePage),
            ),
          );
        },
        title: 'কৃষক এর তথ্য সম্পাদনা করুন',
      ),
    );
  }
}

/// Displays the Body of FarmerProfileView
class FarmerProfileView extends StatelessWidget {
  const FarmerProfileView({
    required this.farmerProfilePage,
    super.key,
  });

  final FarmerEntity farmerProfilePage;
  @override
  Widget build(BuildContext context) {
    // print(
    //     'calling farmer for farmeprofile VIEW -> ${farmerProfilePage.full_name}');
    return FarmerProfileBody(
      farmerProfilePage: farmerProfilePage,
    );
  }
}
