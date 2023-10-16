import 'package:deshifarmer/domain/entities/source_entity/source_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/activity/api/harvest_api.dart';
import 'package:deshifarmer/presentation/pages/group_detail/components/harvest_card.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:flutter/material.dart';

/// {@template harvest_body}
/// Body of the HarvestPage.
///
/// Add what it does
/// {@endtemplate}
class HarvestBody extends StatelessWidget {
  /// {@macro harvest_body}
  const HarvestBody({super.key});

  @override
  Widget build(BuildContext context) {
    final loginState = context.read<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'উৎপাদনের তালিকা ',
              style: TextStyle(
                fontSize: titleFont,
                fontWeight: FontWeight.w600,
                color: priceBoxColor,
              ),
            ),
          ),
          FutureBuilder<List<SourcingEntity>?>(
            future: HarvestAPI().getHarvests(token),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<SourcingEntity>?> snapshot,
            ) {
              return snapshot.hasData
                  ? snapshot.data!.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(child: Text('কিছুই পাওয়া যায়নি')),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            final currentFarmer = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.all(8),
                              child: HarvestCard(
                                farmerID: currentFarmer.which_farmer,
                                farmerName: currentFarmer.farmer_name,
                                name: currentFarmer.product_name,
                                image: currentFarmer.product_images.firstOrNull
                                    .toString(),
                                qt: currentFarmer.quantity.toString(),
                                unit: currentFarmer.unit,
                                date: currentFarmer.created_at,
                                soldPrice: currentFarmer.sell_price,
                              ),
                            );
                          },
                        )
                  : const Center(
                      child: PrimaryLoadingIndicator(),
                    );
            },
          ),
        ],
      ),
    );
  }
}
