import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deshifarmer/data/datasources/local/shared_prefs/local_database_sf.dart';
import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/components/farmerlistview_withsearch.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/view/login_page.dart';
import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyFarmerListo extends StatelessWidget {
  const MyFarmerListo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyFarmerBloc, MyFarmerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MyFarmerInitial) {
          return Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: const PrimaryLoadingIndicator(),
          );
        } else if (state is MyFarmerFailed) {
          if (state.message.contains('401') &&
              state.message.contains('Unauthenticated.')) {
            SharedPrefDBServices().removeLoginToken();
            // send the user to login page
            Navigator.of(context).popUntil((route) => route.isFirst);
            context.read<LoginBloc>().add(const ResetLoginEvent());
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                LottieBuilder.asset(
                  'assets/animations/failed.json',
                  repeat: false,
                ),

                /// failed to fetch order message in Bangla
                Text(
                  state.message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        } else if (state is MyFarmerSuccess) {
          return FarmerListViewWithSearch(
            allFarmerListResp: state.allFarmerListResp,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
