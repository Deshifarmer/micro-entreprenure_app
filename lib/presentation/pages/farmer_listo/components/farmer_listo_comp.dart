import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/components/farmerlistview_withsearch.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
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
          final connectivityResult = Connectivity().checkConnectivity();
          return FutureBuilder<ConnectivityResult>(
            future: connectivityResult,
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.data == ConnectivityResult.none) {
                return Column(
                  children: [
                    LottieBuilder.asset('assets/animations/no_internet.json'),
                    const Text('ইন্টারনেট সংযোগ নেই'),
                  ],
                );
              }
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    LottieBuilder.asset('assets/animations/failed.json'),

                    /// failed to fetch order message in Bangla
                    Text(
                      state.message,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            },
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
