import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/order/widgets/order_body2.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

/// {@template order_page}
/// A description for OrderPage
/// {@endtemplate}
class OrderPage extends StatelessWidget {
  /// {@macro order_page}
  const OrderPage({super.key, this.isBack});

  /// The static route for OrderPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const OrderPage());
  }

  final bool? isBack;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final loginState = context.read<LoginBloc>().state;
        final token = loginState is LoginSuccess
            ? loginState.successLoginEntity.token
            : '';
        context.read<UserProfileBloc>().add(GetUserProfileEvent(token: token));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'আমার অর্ডার  সমূহ',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          // centerTitle: true,
          leading: isBack == true
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    final loginState = context.read<LoginBloc>().state;
                    final token = loginState is LoginSuccess
                        ? loginState.successLoginEntity.token
                        : '';
                    context
                        .read<UserProfileBloc>()
                        .add(GetUserProfileEvent(token: token));
                    debugPrint('GetUserProfileEvent in OrderPage');
                    Navigator.of(context).pop();
                  },
                )
              : null,
        ),
        body: const OrderView(),
      ),
    );
  }
}

/// {@template order_view}
/// Displays the Body of OrderView
/// {@endtemplate}
class OrderView extends StatelessWidget {
  /// {@macro order_view}
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginState = context.watch<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    // return const OrderBody();
    return OrderBody2(
      token: token,
    );
  }
}
