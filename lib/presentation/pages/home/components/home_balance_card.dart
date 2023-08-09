import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:flutter/material.dart';

class HomeBalanceCard extends StatelessWidget {
  const HomeBalanceCard({
    super.key,
    required this.usrProfile,
  });

  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xffFF9300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                r'$',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'balance',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    usrProfile.account_details.first.net_balance ?? '',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
          // row
          // a big logo
          // column -> balance, money
          // transaction
          Container(
            width: 150,
            // alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffFFE9CD),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Transaction',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color(0xff8C580B),
                      ),
                  textAlign: TextAlign.center,
                ),
                const Icon(Icons.arrow_right_alt_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
