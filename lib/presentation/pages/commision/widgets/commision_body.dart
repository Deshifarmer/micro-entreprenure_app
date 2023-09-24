import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/commision/components/commision_card.dart';
import 'package:deshifarmer/presentation/pages/commision/widgets/all_commission.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';

/// {@template commision_body}
/// Body of the CommisionPage.
///
/// Add what it does
/// {@endtemplate}
class CommisionBody extends StatelessWidget {
  /// {@macro commision_body}
  const CommisionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommisionBloc, CommisionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Text(
                'আপনার সেলস এর কমিশন এর তালিকা',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: CommisionCard(
                      isFilled: true,
                      subtitle: '৳ 0',
                      title: 'এই মাস',
                    ),
                  ),
                  Expanded(
                    child: CommisionCard(
                      isFilled: false,
                      subtitle: '৳ 0',
                      title: 'সর্বমোট',
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              const AllCommissionBox(),
            ],
          ),
        );
      },
    );
  }
}
