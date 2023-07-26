import 'package:deshifarmer/presentation/pages/login/components/bottom_info_login.dart';
import 'package:deshifarmer/presentation/pages/login/widgets/login_body.dart';
import 'package:flutter/material.dart';

/// {@template login_page}
/// A description for LoginPage
/// {@endtemplate}
class LoginPage extends StatelessWidget {
  /// {@macro login_page}
  const LoginPage({super.key});

  /// The static route for LoginPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.white,
        body: LoginView(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(8),
          child: BottomInfo(),
        ),
      );
}

/// {@template login_view}
/// Displays the Body of LoginView
/// {@endtemplate}
class LoginView extends StatelessWidget {
  /// {@macro login_view}
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}
