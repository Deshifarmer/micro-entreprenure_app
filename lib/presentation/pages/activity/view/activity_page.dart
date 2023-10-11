import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/pages/activity/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/activity/pages/activity_select_farm.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/primary_loading_progress.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:flutter/material.dart';

/// {@template activity_page}
/// A description for ActivityPage
/// {@endtemplate}
class ActivityPage extends StatefulWidget {
  /// {@macro activity_page}
  const ActivityPage({super.key});

  /// The static route for ActivityPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ActivityPage());
  }

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: isLoading
            ? SizedBox(
                height: 50,
                width: 50,
                child: const Center(
                  child: PrimaryLoadingIndicator(),
                ),
              )
            : SecondayButtonGreen(
                onpress: () async {
                  if (isLoading) {
                    return;
                  }
                  setState(() {
                    isLoading = true;
                  });
                  final loginState = context.read<LoginBloc>().state;
                  final token = loginState is LoginSuccess
                      ? loginState.successLoginEntity.token
                      : '';
                  final allFarmerListResp =
                      await DeshiFarmerAPI().getFarmers2(token);

                  Navigator.push(
                    context,
                    PageAnimationWrapper.fadeThroughTransitionPageWrapper(
                      ActivityAddFarm(
                        allFarmers: allFarmerListResp?.farmers ?? [],
                      ),
                    ),
                  );

                  setState(() {
                    isLoading = false;
                  });
                },
                title: 'নতুন কার্যকলাপ ট্র্যাক করুন',
                // title: 'record new activity',
                btnColor: priceBoxColor,
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
    // /! TODO: uncomment this
    // return const ActivityBody();
    return Container();
  }
}

class ShowLoadingOnButtonActivity extends StatefulWidget {
  const ShowLoadingOnButtonActivity({
    super.key,
  });

  @override
  State<ShowLoadingOnButtonActivity> createState() =>
      _ShowLoadingOnButtonActivityState();
}

class _ShowLoadingOnButtonActivityState
    extends State<ShowLoadingOnButtonActivity> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SecondayButtonGreen(
            onpress: () async {
              if (isLoading) {
                return;
              }
              setState(() {
                isLoading = true;
              });
              final loginState = context.read<LoginBloc>().state;
              final token = loginState is LoginSuccess
                  ? loginState.successLoginEntity.token
                  : '';
              final allFarmerListResp =
                  await DeshiFarmerAPI().getFarmers2(token);

              Navigator.push(
                context,
                PageAnimationWrapper.fadeThroughTransitionPageWrapper(
                  ActivityAddFarm(
                    allFarmers: allFarmerListResp?.farmers ?? [],
                  ),
                ),
              );

              setState(() {
                isLoading = false;
              });
            },
            title: 'নতুন কার্যকলাপ ট্র্যাক করুন',
            // title: 'record new activity',
            btnColor: priceBoxColor,
          )
        : const Center(
            child: PrimaryLoadingIndicator(),
          );
  }
}
