import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/widgets/add_farmer_body.dart';

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
        appBar: AppBar(
          title: const Text('কৃষকের রেজিস্ট্রেশন করুন'),
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
