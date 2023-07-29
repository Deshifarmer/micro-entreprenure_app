import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/company_entity/company_response_entity.dart';
import 'package:flutter/material.dart';

class CompanyCardView extends StatelessWidget {
  const CompanyCardView({
    required this.currentCompany,
    super.key,
  });

  final CompanyEntity currentCompany;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              '${Strings.domain}/storage${currentCompany.photo}',
            ),
          ),
        ),
        Text(
          currentCompany.full_name ?? '',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.fade,
              ),
        )
      ],
    );
  }
}
