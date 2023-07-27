import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/presentation/blocs/company/company_bloc.dart';
import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:flutter/material.dart';

class CampanyCircularListView extends StatelessWidget {
  const CampanyCircularListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 100,
      child: BlocConsumer<CompanyBloc, CompanyState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CompanySuccess) {
            final allCompany = state.allCompanyListResp;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: allCompany.allCompany.length,
              itemBuilder: (context, index) {
                final currentCompany = allCompany.allCompany.elementAt(index);
                // print('${Strings.domain}/storage${currentCompany.photo}');
                return Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      // CircleAvatar(
                      //   radius: 30,
                      //   child: Text(index.toString()),
                      // ),
                      // Text(currentCompany.photo),
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
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
