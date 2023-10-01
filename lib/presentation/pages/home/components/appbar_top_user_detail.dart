import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarTopUserDetail extends StatelessWidget {
  const AppBarTopUserDetail({
    required this.usrProfile,
    super.key,
  });

  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        /// user profile image and name
        Row(
          children: [
            /// user profile image
            ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(
                  25,
                ), // Image radius
                child: CachedNetworkImage(
                  imageUrl:
                      '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage${usrProfile.photo}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(
            //   width: getProportionateScreenWidth(20),
            // ),
            /// user name and id
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    usrProfile.full_name ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          letterSpacing: 0.9,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '#${usrProfile.df_id}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          // letterSpacing: 0.9,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),

        /// help and notification
        Row(
          children: [
            InkWell(
              onTap: () async {
                final url = Uri.parse('https://me.deshifarmer.co/help');
                await launchUrl(url);
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'হেল্প?',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color(0xff93EE93),
                      ),
                ),
              ),
            ),
            IconButton.filled(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color(0xff93EE93)),
              ),
              color: Colors.green,
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
          ],
        ),
      ],
    );
  }
}
