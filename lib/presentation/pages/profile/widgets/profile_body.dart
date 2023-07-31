import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:flutter/material.dart';

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
        return ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            if (userProfile is UserProfileFetchSuccess) ...[
              Padding(
                padding: const EdgeInsets.all(25),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    '${Strings.domain}/storage/${userProfile.userProfile.photo}',
                    // height: 100,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  userProfile.userProfile.full_name ?? '',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.green[700],
                      ),
                  textAlign: TextAlign.center,
                ),
              ),

              /// code
              Text(
                userProfile.userProfile.df_id ?? '',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.green[700],
                    ),
                textAlign: TextAlign.center,
              ),

              /// location
              Text(
                userProfile.userProfile.home_district ?? '',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.grey[900],
                    ),
                textAlign: TextAlign.center,
              ),

              /// COulumn -> row of
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('আমার তথ্য'),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('ফোন'),
                        Text(
                          userProfile.userProfile.phone ?? '',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('এনআইডি নং '),
                        Text(
                          userProfile.userProfile.nid ?? '',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ক্লাস্টার'),
                        Text(
                          userProfile.userProfile.commission ?? '',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('লিঙ্গ '),
                        Text(
                          userProfile.userProfile.gender ?? '',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]
          ],
        );
      },
    );
  }
}
