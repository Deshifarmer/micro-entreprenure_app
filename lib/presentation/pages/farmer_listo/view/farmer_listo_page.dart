import 'package:flutter/material.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/widgets/farmer_listo_body.dart';

/// {@template farmer_listo_page}
/// A description for FarmerListoPage
/// {@endtemplate}
class FarmerListoPage extends StatelessWidget {
  /// {@macro farmer_listo_page}
  const FarmerListoPage({super.key});

  /// The static route for FarmerListoPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const FarmerListoPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FarmerListoBloc(),
      child: Scaffold(
        appBar: AppBar(
            // title: Text('Farmer Lists'),
            ),
        body: const FarmerListoView(),
      ),
    );
  }
}

/// {@template farmer_listo_view}
/// Displays the Body of FarmerListoView
/// {@endtemplate}
class FarmerListoView extends StatelessWidget {
  /// {@macro farmer_listo_view}
  const FarmerListoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const FarmerListoBody();
  }
}
