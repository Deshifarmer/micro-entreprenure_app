import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/commision/widgets/commision_body.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

/// {@template commision_page}
/// A description for CommisionPage
/// {@endtemplate}
class CommisionPage extends StatelessWidget {
  /// {@macro commision_page}
  const CommisionPage({super.key});

  /// The static route for CommisionPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CommisionPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommisionBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'সকল কমিশন  %',
            style: TextStyle(
              color: priceBoxColor,
            ),
          ),
        ),
        body: const CommisionView(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
            vertical: getProportionateScreenHeight(10),
          ),
          // ignore: lines_longer_than_80_chars
          child: const Text(
            'আমরা শেষ 20টি লেনদেন দেখাচ্ছি। আপনি যদি সমস্ত কমিশন \nঅ্যাক্সেস করতে চান আমাদের সাথে যোগাযোগ করুন',
          ),
        ),
      ),
    );
  }
}

/// {@template commision_view}
/// Displays the Body of CommisionView
/// {@endtemplate}
class CommisionView extends StatelessWidget {
  /// {@macro commision_view}
  const CommisionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommisionBody();
  }
}
