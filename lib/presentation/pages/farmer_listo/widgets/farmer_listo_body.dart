import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/view/add_farmer_page.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/components/farmer_listo_comp.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// {@template farmer_listo_body}
/// Body of the FarmerListoPage.
///
/// Add what it does
/// {@endtemplate}
class FarmerListoBody extends StatelessWidget {
  /// {@macro farmer_listo_body}
  const FarmerListoBody({super.key});

  @override
  Widget build(BuildContext context) {
    // final myFarmerState = context.read<MyFarmerBloc>().state;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'আমার কৃষক তালিকা',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          //! Farmer List View
          const MyFarmerListo(),
          //! a button to goto add new farmer page

          // PrimaryButtonGreen(
          //   onpress: () {
          //     Navigator.push(
          //       context,
          //       CupertinoPageRoute<AddFarmerPage>(
          //         builder: (context) {
          //           return const AddFarmerPage();
          //         },
          //       ),
          //     );
          //   },
          //   title: 'নতুন কৃষক যোগ করুন',
          // ),
        ],
      ),
    );
  }
}
