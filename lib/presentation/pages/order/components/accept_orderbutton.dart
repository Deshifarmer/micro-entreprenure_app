
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AcceptOrderButton extends StatefulWidget {
  const AcceptOrderButton({
    required this.orderID,
    required this.token,
    super.key,
  });

  final String orderID;
  final String token;

  @override
  State<AcceptOrderButton> createState() => _AcceptOrderButtonState();
}

class _AcceptOrderButtonState extends State<AcceptOrderButton> {
  bool isLoading = false;
  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (isLoading) {
          return;
        }
        setState(() {
          isLoading = true;
        });
        final dfAPI = DeshiFarmerAPI();
        final isSuccess =
            await dfAPI.collectOrder(widget.orderID, widget.token);
        if (isSuccess) {
          // show a snackbar with success message
          ScaffoldMessenger.of(context).showSnackBar(
            successSnackBar('অর্ডার গ্রহণ করা হয়েছে'),
          );
          final loginState = context.read<LoginBloc>().state;
          final token = loginState is LoginSuccess
              ? loginState.successLoginEntity.token
              : '';
          if (token.isNotEmpty) {
            context.read<OrderBloc>().add(InitOrders(token));
          }
          setState(() {
            isAccepted = true;
            isLoading = false;
          });
        } else {
          // show a snackbar with failed message
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar('অর্ডার গ্রহণ করা হয়নি'));
          setState(() {
            isAccepted = false;
            isLoading = false;
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: isLoading
          ? const Text(
              'লোড হচ্ছে...',
              style: TextStyle(
                color: Colors.white,
              ),
            )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .shimmer()
          : const Text(
              'অর্ডার গ্রহণ করুন',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
    );
  }
}

