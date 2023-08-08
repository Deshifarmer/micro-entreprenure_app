import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:deshifarmer/presentation/widgets/farmer_card.dart';
import 'package:flutter/material.dart';

class MyFarmerListo extends StatelessWidget {
  const MyFarmerListo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyFarmerBloc, MyFarmerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MyFarmerInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MyFarmerFailed) {
          return const Center(
            child: Text('Famer Fetched Failed'),
          );
        } else if (state is MyFarmerSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.allFarmerListResp.farmers.length,
            itemBuilder: (context, index) {
              final currentFarmer =
                  state.allFarmerListResp.farmers.elementAt(index);
              return FarmerCard(currentFarmer: currentFarmer);
              // return state.allFarmerListResp.farmers
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
