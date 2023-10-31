import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/widgets/add_farmer_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

/// {@template add_farmer_page}
/// A description for AddFarmerPage
/// {@endtemplate}
class AddFarmerPage extends StatelessWidget {
  /// {@macro add_farmer_page}
  const AddFarmerPage({super.key});

  /// The static route for AddFarmerPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddFarmerPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFarmerBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.navigate_before,
              color: priceBoxColor,
            ),
          ),
          title: const Text(
            'কৃষকের রেজিস্ট্রেশন করুন',
            style: TextStyle(
              color: priceBoxColor,
            ),
          ),
        ),
        body: const AddFarmerView(),
      ),
    );
  }
}

/// {@template add_farmer_view}
/// Displays the Body of AddFarmerView
/// {@endtemplate}
class AddFarmerView extends StatelessWidget {
  /// {@macro add_farmer_view}
  const AddFarmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddFarmerBody();
  }
}
