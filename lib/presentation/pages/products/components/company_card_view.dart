import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/domain/entities/company_entity/company_response_entity.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:flutter/material.dart';

class CompanyCardView extends StatelessWidget {
  const CompanyCardView({
    required this.currentCompany,
    super.key,
  });

  final CompanyEntity currentCompany;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        SizedBox(
          height: 42,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage${currentCompany.photo}',
            ),
          ),
        ),
        // Text(
        //   currentCompany.full_name ?? '',
        //   style: Theme.of(context).textTheme.titleSmall!.copyWith(
        //         fontWeight: FontWeight.normal,
        //         overflow: TextOverflow.fade,
        //       ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '${currentCompany.full_name?.substring(0, 7)}...',
            // currentCompany.full_name ?? '',
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
