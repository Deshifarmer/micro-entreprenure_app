import 'package:deshifarmer/core/error/exceptions.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/data/models/order_model.dart';
import 'package:deshifarmer/domain/entities/farmer_entity/farmer_entity.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/services/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';

class ConfirmOrderFutreBldr extends StatelessWidget {
  const ConfirmOrderFutreBldr({
    required this.selectedFarmer,
    required this.orders,
    required this.token,
    super.key,
  });

  final String token;
  final FarmerEntity? selectedFarmer;
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DeshiFarmerAPI().placeAnOrder(
        token,
        selectedFarmer?.farmer_id ?? '',
        orders,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          final value = snapshot.data;
          if (value is Success) {
            // pop this page after 2 seconds
            debugPrint('success response!');
            Future.delayed(
              const Duration(seconds: 2),
              () {
                debugPrint('poping hopping');
                Navigator.pop(context);
                Navigator.pop(context);
              },
            );

            context.read<CartBloc>().add(ResetCart());
            return Column(
              children: [
                Center(
                  child: Text(
                    'Congratulations',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                widgetHeight(40),
                FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: null,
                  child: const Icon(
                    Icons.verified,
                    size: 60,
                    // color: Colors.black,
                  ),
                ),
                widgetHeight(40),
                Text(
                  'Order has been placed',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: borderColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            );
          } else {
            return FloatingActionButton(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: null,
              child: const Icon(
                Icons.crop_square_sharp,
                size: 60,
                // color: Colors.black,
              ),
            );
          }
        } else if (snapshot.hasError) {
          return FloatingActionButton(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: null,
            child: const Icon(
              Icons.multiple_stop,
              size: 60,
              // color: Colors.black,
            ),
          );
        }
        return const PrimaryLoadingIndicator();
      },
    );
  }
}
