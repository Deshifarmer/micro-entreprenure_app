import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/app/app.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/data/datasources/local/shared_prefs/local_database_sf.dart';
import 'package:deshifarmer/data/datasources/remote/apis/api_source.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/profile/pages/details_update.dart';
import 'package:deshifarmer/presentation/pages/profile/pages/settings_update.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/presentation/widgets/snackbar_custom.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Body of the ProfilePage.
/// Add what it does
class ProfileBody extends StatelessWidget {
  /// {@macro profile_body}
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final userProfile = context.read<UserProfileBloc>().state;
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
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
                      child: CachedNetworkImage(
                        imageUrl: checkDomain(
                          Strings.getServerOrLocal(ServerOrLocal.server),
                        )
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      height: getProportionateScreenHeight(180),
                      child: Card(
                        color: priceBoxColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'মোবাইল নম্বর',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                userProfile.userProfile.phone ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                              height10,
                              Text(
                                'ঠিকানা',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                userProfile.userProfile.present_address ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      height: getProportionateScreenHeight(180),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'কমিশন',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                '৳ 5640',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              height10,
                              Text(
                                'মাসিক উপস্থিতি',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                '90%',
                                style: Theme.of(context).textTheme.titleSmall,
                                softWrap: false,
                                maxLines: 3,
                                // textHeightBehavior: TextHeightBehavior(
                                //   applyHeightToFirstAscent: false,
                                //   applyHeightToLastDescent: false,
                                //   leadingDistribution:
                                //       TextLeadingDistribution.even,
                                // ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              height10,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
                    final url = Uri.parse('https://me.deshifarmer.co/help');
                    await launchUrl(url);
                  },
                  title: const Text('হেল্প'),
                  trailing: const Icon(Icons.navigate_next),
                ),

                /// log out
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () async {
                    final loginState = context.read<LoginBloc>().state;

                    /// hit the logout api
                    final api = DeshiFarmerAPI();
                    if (loginState is LoginSuccess) {
                      final value = await api.userLogout(
                        loginState.successLoginEntity.token,
                      );

                      if (value) {
                        context.read<LoginBloc>().add(const ResetLoginEvent());

                        /// remove the token from shared pref
                        await SharedPrefDBServices().removeLoginToken();
                        // Navigator.of(context).popUntil(
                        //   (route) => route.isFirst,
                        // );
                        Navigator.pushAndRemoveUntil(
                          context,
                          // LoginPage.route(),
                          MaterialPageRoute(builder: (context) => App()),
                          (route) => false,
                        );
                      } else {
                        /// show a snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          errorSnackBar('লগ আউট করা সম্ভব হচ্ছে না'),
                        );
                      }
                    }
                  },
                  title: const Text(
                    'লগ আউট',
                    style: TextStyle(
                        // color: Colors.white,
                        ),
                  ),
                  tileColor: Colors.redAccent,
                  trailing: const Icon(
                    Icons.settings_power,
                    // color: Colors.white,
                  ),
                ),
              ],
              height10,
              height10, height10,
              // Text('আমরা আপনাকে কীভাবে সাহায্য করতে পারি  ?'),
            ],
          ),
        );
      },
    );
  }
}
