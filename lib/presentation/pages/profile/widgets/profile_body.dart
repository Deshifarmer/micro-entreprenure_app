import 'package:animations/animations.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/view/login_page.dart';
import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/profile/pages/details_update.dart';
import 'package:deshifarmer/presentation/pages/profile/pages/settings_update.dart';
import 'package:deshifarmer/presentation/shapes/deshifarmer_logo.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// {@template profile_body}
/// Body of the ProfilePage.
///
/// Add what it does
/// {@endtemplate}
class ProfileBody extends StatelessWidget {
  /// {@macro profile_body}
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final userProfile = context.read<UserProfileBloc>().state;
        // return ListView(
        //   children: [
        //     const SizedBox(
        //       height: 20,
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //     if (userProfile is UserProfileFetchSuccess) ...[
        //       Padding(
        //         padding: const EdgeInsets.all(25),
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(50),
        //           child: Image.network(
        //             '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${userProfile.userProfile.photo}',
        //             // height: 100,
        //           ),
        //         ),
        //       ),
        //       Padding(
        //         padding: const EdgeInsets.all(8),
        //         child: Text(
        //           userProfile.userProfile.full_name ?? '',
        //           style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        //                 color: Colors.green[700],
        //               ),
        //           textAlign: TextAlign.center,
        //         ),
        //       ),

        //       /// code
        //       Text(
        //         userProfile.userProfile.df_id ?? '',
        //         style: Theme.of(context).textTheme.headlineMedium!.copyWith(
        //               color: Colors.green[700],
        //             ),
        //         textAlign: TextAlign.center,
        //       ),

        //       /// location
        //       Text(
        //         userProfile.userProfile.home_district ?? '',
        //         style: Theme.of(context).textTheme.labelLarge!.copyWith(
        //               color: Colors.grey[900],
        //             ),
        //         textAlign: TextAlign.center,
        //       ),

        //       /// COulumn -> row of
        //       Padding(
        //         padding: const EdgeInsets.all(15),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             const Text('আমার তথ্য'),
        //             const Divider(),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 const Text('ফোন'),
        //                 Text(
        //                   userProfile.userProfile.phone ?? '',
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ],
        //             ),
        //             const Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Text('এনআইডি নং '),

        //                 ///! TODO: uncomment this
        //                 // Text(
        //                 //   userProfile.userProfile.nid ?? '',
        //                 //   textAlign: TextAlign.center,
        //                 // ),
        //               ],
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               // crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 const Text('ক্লাস্টার'),
        //                 Text(
        //                   userProfile.userProfile.commission ?? '',
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ],
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 const Text('লিঙ্গ '),
        //                 Text(
        //                   userProfile.userProfile.gender ?? '',
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ],
        // );
        return ListView(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            if (userProfile is UserProfileFetchSuccess) ...[
              Hero(
                tag: 'userProfilePIC',
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      checkDomain(
                              Strings.getServerOrLocal(ServerOrLocal.server))
                          ? dummyImage
                          : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage/${userProfile.userProfile.photo}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  userProfile.userProfile.full_name ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              /// code
              Text(
                '#${userProfile.userProfile.df_id ?? ''}}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: tertiaryColor2,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 40,
                // width: getProportionateScreenWidth(60),
                width: MediaQuery.sizeOf(context).width / 1.2,
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: priceBoxColor,
                      // radius: 30,
                      child: Icon(Icons.check, size: 15),
                    ),
                    Expanded(
                      child: Text(
                        'সকল তথ্য আপ টু ডেট রয়েছে ',
                        // 'No information update is required at this moment',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),

              /// info update
              OpenContainer(
                closedBuilder: (context, action) {
                  return ListTile(
                    onTap: action,
                    title: const Text('তথ্য আপডেট'),
                    trailing: const Icon(Icons.navigate_next),
                  );
                },
                openElevation: 0,
                closedElevation: 0,
                closedColor: Colors.transparent,
                openColor: Colors.transparent,
                middleColor: Colors.transparent,
                openBuilder: (context, action) {
                  return ProfileUpdatePage(
                    farmerID: userProfile.userProfile.df_id ?? '',
                    farmerPhoto: userProfile.userProfile.photo ?? '',
                    fullName: userProfile.userProfile.full_name ?? '',
                  );
                },
              ),

              /// settings
              OpenContainer(
                closedBuilder: (context, action) {
                  return ListTile(
                    onTap: action,
                    title: const Text('সেটিংস'),
                    trailing: const Icon(Icons.navigate_next),
                  );
                },
                openElevation: 0,
                closedElevation: 0,
                closedColor: Colors.transparent,
                openColor: Colors.transparent,
                middleColor: Colors.transparent,
                openBuilder: (context, action) {
                  return ProfileSettingsPage(
                    farmerID: userProfile.userProfile.df_id ?? '',
                    farmerPhoto: userProfile.userProfile.photo ?? '',
                    fullName: userProfile.userProfile.full_name ?? '',
                  );
                },
              ),

              /// help
              ListTile(
                onTap: () async {
                  /// open help url (co.deshi.farmer.help)
                  Uri _url = Uri.parse('https://me.deshifarmer.co/help');
                  await launchUrl(_url);
                },
                title: const Text('হেল্প'),
                trailing: const Icon(Icons.navigate_next),
              ),

              /// log out
              ListTile(
                onTap: () async {
                  final loginState = context.read<LoginBloc>().state;

                  /// hit the logout api
                  DeshiFarmerAPI api = DeshiFarmerAPI();
                  if (loginState is LoginSuccess) {
                    final value = await api.userLogout(
                      loginState.successLoginEntity.token,
                    );
                    if (value) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        LoginPage.route(),
                        (route) => false,
                      );
                    } else {
                      /// show a snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackBar('লগ আউট করা সম্ভব হচ্ছে না'));
                    }
                  }
                },
                title: const Text('লগ আউট'),
                trailing: const Icon(Icons.settings_power),
              ),
            ],

            // Text('আমরা আপনাকে কীভাবে সাহায্য করতে পারি  ?'),
          ],
        );
      },
    );
  }
}
