import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class AppBarTopUserDetail extends StatelessWidget {
  const AppBarTopUserDetail({
    required this.usrProfile, super.key,
  });

  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(
                    30,
                  ), // Image radius
                  child: Image.network(
                    '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage${usrProfile.photo}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    usrProfile.full_name ?? '',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.9,
                        ),
                  ),
                  Text(
                    usrProfile.df_id ?? '',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.9,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'help?',
                  style: TextStyle(color: Color(0xff93EE93)),
                ),
              ),
              IconButton.filled(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xff93EE93)),),
                color: Colors.green,
                onPressed: () {},
                icon: const Icon(Icons.notifications_none),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
