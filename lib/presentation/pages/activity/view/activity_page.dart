import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/pages/activity/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/activity_select_farm.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

/// {@template activity_page}
/// A description for ActivityPage
/// {@endtemplate}
class ActivityPage extends StatelessWidget {
  /// {@macro activity_page}
  const ActivityPage({super.key});

  /// The static route for ActivityPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ActivityPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityBloc(),
      child: Scaffold(
        backgroundColor: backgroundColor2,
        appBar: AppBar(
          backgroundColor: backgroundColor2,
          title: const Text('সাম্প্রতিক কার্যকলাপ '),
          // toolbarHeight: 30,
          surfaceTintColor: backgroundColor2,
        ),
        body: const ActivityView(),
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SecondayButtonGreen(
            onpress: () {
              Navigator.push(
                context,
                PageAnimationWrapper.fadeThroughTransitionPageWrapper(
                  const ActivityAddFarm(),
                ),
              );
            },
            title: 'নতুন কার্যকলাপ ট্র্যাক করুন ',
            // title: 'record new activity',
            btnColor: priceBoxColor,
          ),
        ),
      ),
    );
  }
}

/// {@template activity_view}
/// Displays the Body of ActivityView
/// {@endtemplate}
class ActivityView extends StatelessWidget {
  /// {@macro activity_view}
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    ///! TODO: uncomment this
    // return const ActivityBody();
    return Container();
  }
}
