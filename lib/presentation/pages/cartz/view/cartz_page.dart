import 'package:deshifarmer/presentation/pages/cartz/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/cartz/widgets/cartz_body.dart';
import 'package:flutter/material.dart';

/// {@template cartz_page}
/// A description for CartzPage
/// {@endtemplate}
class CartzPage extends StatelessWidget {
  /// {@macro cartz_page}
  const CartzPage({super.key});

  /// The static route for CartzPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CartzPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ব্যাগের পণ্য'),
      ),
      body: const CartzView(),
    );
  }
}

/// {@template cartz_view}
/// Displays the Body of CartzView
/// {@endtemplate}
class CartzView extends StatelessWidget {
  /// {@macro cartz_view}
  const CartzView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartzBody();
  }
}
