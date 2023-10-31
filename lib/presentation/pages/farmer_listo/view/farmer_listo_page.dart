import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/components/farmer_listo_page2.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

/// {@template farmer_listo_page}
/// A description for FarmerListoPage
/// {@endtemplate}
class FarmerListoPage extends StatelessWidget {
  /// {@macro farmer_listo_page}
  const FarmerListoPage({super.key, this.isBack});
  final bool? isBack;

  /// The static route for FarmerListoPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const FarmerListoPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FarmerListoBloc(),
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            final loginState = context.read<LoginBloc>().state;
            final token = loginState is LoginSuccess
                ? loginState.successLoginEntity.token
                : '';
            context
                .read<UserProfileBloc>()
                .add(GetUserProfileEvent(token: token));
            debugPrint("GetUserProfileEvent in FarmerListoPage");
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'আমার কৃষক তালিকা',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            body: const FarmerListoView(),
          ),
        ),
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
    // return const FarmerListoBody();
    return const FarmerListPage2();
  }
}
