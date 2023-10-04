import 'package:deshifarmer/presentation/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/presentation/cubit/dropdown/dropdown_cubit.dart';
import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/cartz/pages/conformation_page.dart';
import 'package:deshifarmer/presentation/pages/cartz/widgets/cartz_body.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

/// {@template cartz_page}
/// A description for CartzPage
/// {@endtemplate}
class CartzPage extends StatelessWidget {
  /// {@macro cartz_page}
  const CartzPage({super.key});

  /// The static route for CartzPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CartzPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ব্যাগের পণ্য'),
      ),
      body: const CartzView(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: SecondayButtonGreen(
          onpress: () {
            final cartItems = context.read<CartBloc>().state;

            /// check if the items are not empty
            if (cartItems is CartAddingState) {
              if (cartItems.carts.isEmpty) {
                // show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('আপনার ব্যাগে কোন পণ্য নেই'),
                  ),
                );
              } else if (context.read<DropdownForFarmerCubit>().state == null) {
                // show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('আপনার কোন কৃষক নির্বাচন করা হয়নি'),
                  ),
                );
              } else if (context
                  .read<DropdownForPaymentCubit>()
                  .state
                  .isEmpty) {
                // show a snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('আপনার কোন পেমেন্ট পদ্ধতি নির্বাচন করা হয়নি'),
                  ),
                );
              } else if (context
                      .read<DropdownForFarmerCubit>()
                      .state
                      ?.farmer_id ==
                  'x') {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('আপনার কোন কৃষক নির্বাচন করা হয়নি'),
                  ),
                );
              } else {
                /// check if any farmer selected
                /// if user selected user
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const OrderConformationPage(),
                  ),
                );
              }
              return;
            }

            /// check if any farmer selected
            /// if user selected user
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => const OrderConformationPage(),
            //   ),
            // );
          },
          title: 'অর্ডার করুন',
        ),
      ),
    );
  }
}

/// {@template cartz_view}
/// Displays the Body of CartzView
/// {@endtemplate}
class CartzView extends StatelessWidget {
  /// {@macro cartz_view}
  const CartzView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: CartzBody(),
    );
  }
}
