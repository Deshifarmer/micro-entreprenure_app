import 'package:deshifarmer/presentation/pages/agri_advisory/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/widgets/agri_advisory_body.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/seconday_btn.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';

/// {@template agri_advisory_page}
/// A description for AgriAdvisoryPage
/// {@endtemplate}
class AgriAdvisoryPage extends StatelessWidget {
  /// {@macro agri_advisory_page}
  const AgriAdvisoryPage({super.key});

  /// The static route for AgriAdvisoryPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AgriAdvisoryPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AgriAdvisoryBloc, AgriAdvisoryState>(
      listener: (context, state) {
        if (state is AgriFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(errorSnackBar('Advisory Adding failed'));
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(successSnackBar('Successfully Added Advisory'));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          backgroundColor: backgroundColor2,
          appBar: AppBar(
            toolbarHeight: 30,
            backgroundColor: backgroundColor2,
            surfaceTintColor: backgroundColor2,
          ),
          body: const AgriAdvisoryView(),
          bottomNavigationBar: SecondayButtonGreen(
            btnColor: priceBoxColor,
            onpress: () async {
              final agriAdvisory = context.read<AgriAdvisoryBloc>().state;
              if (agriAdvisory is AgriAdvisoryInitial) {
                print('Photos -> ${agriAdvisory.images}');
                print('subject -> ${agriAdvisory.subjects.text}');
                print('timeslot -> ${agriAdvisory.timeslots.text}');
                print('groupid -> ${agriAdvisory.groupID.text}');
                print('notes -> ${agriAdvisory.notes.text}');
                print('members -> ${agriAdvisory.members.toSet().toList()}');

                final loginState = context.read<LoginBloc>().state;
                if (loginState is LoginSuccess) {
                  context.read<AgriAdvisoryBloc>().add(AddAdvisoryEvent(
                        token: loginState.successLoginEntity.token,
                        notes: agriAdvisory.notes.text,
                        groupID: agriAdvisory.groupID.text,
                        subject: agriAdvisory.subjects.text,
                        timeslot: agriAdvisory.timeslots.text,
                        images: agriAdvisory.images,
                        members: agriAdvisory.members.toSet().toList(),
                      ),);
                }
              }
            },
            title: 'সেশন রেকর্ড করুন',
          ),
        );
      },
    );
  }
}

/// {@template agri_advisory_view}
/// Displays the Body of AgriAdvisoryView
/// {@endtemplate}
class AgriAdvisoryView extends StatelessWidget {
  /// {@macro agri_advisory_view}
  const AgriAdvisoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AgriAdvisoryBody();
  }
}
