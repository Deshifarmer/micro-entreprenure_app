import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

class EditFarmerDetails extends StatefulWidget {
  const EditFarmerDetails({
    super.key,
    required this.farmerProfilePage,
  });

  final FarmerEntity farmerProfilePage;
  @override
  State<EditFarmerDetails> createState() => _EditFarmerDetailsState();
}

class _EditFarmerDetailsState extends State<EditFarmerDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [],
      ),
      bottomNavigationBar:
          SecondayButtonGreen(onpress: () {}, title: "কৃষকের তথ্য আপডেট করুন"),
    );
  }
}
