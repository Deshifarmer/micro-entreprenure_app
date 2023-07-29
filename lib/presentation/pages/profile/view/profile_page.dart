import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/profile/widgets/profile_body.dart';
import 'package:flutter/material.dart';

/// {@template profile_page}
/// A description for ProfilePage
/// {@endtemplate}
class ProfilePage extends StatelessWidget {
  /// {@macro profile_page}
  const ProfilePage({super.key});

  /// The static route for ProfilePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileView(),
    );
  }
}

/// {@template profile_view}
/// Displays the Body of ProfileView
/// {@endtemplate}
class ProfileView extends StatelessWidget {
  /// {@macro profile_view}
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileBody();
  }
}
