import 'package:deshifarmer/presentation/blocs/company/company_bloc.dart';
import 'package:deshifarmer/presentation/pages/commision/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/products_bloc.dart';
import 'package:deshifarmer/presentation/pages/products/components/company_card_view.dart';
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
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: allCompany.allCompany.length,
              itemBuilder: (context, index) {
                final currentCompany = allCompany.allCompany.elementAt(index);
                // final companyState = context.read<ProductsBloc>().state;
                // print('${Strings.domain}/storage${currentCompany.photo}');
                return BlocConsumer<ProductsBloc, ProductsState>(
                  listener: (context, companyState) {
                    print('company states -> $companyState');
                  },
                  builder: (context, companyState) {
                    return InkWell(
                      onTap: () {
                        if (companyState is ProductComanySelect) {
                          if (currentCompany.df_id == companyState.companyID) {
                            context
                                .read<ProductsBloc>()
                                .add(const UnSelectCompanyEvent());
                          } else {
                            context.read<ProductsBloc>().add(
                                  SelectCompanysEvent(
                                    currentCompany.df_id ?? '',
                                  ),
                                );
                          }
                        } else {
                          context.read<ProductsBloc>().add(
                                SelectCompanysEvent(currentCompany.df_id ?? ''),
                              );
                        }
                        print("company ID -> ${currentCompany.df_id ?? ''}");
                      },
                      child: Tooltip(
                        message: currentCompany.full_name ?? '',
                        decoration: BoxDecoration(
                          color: Colors.green[400]!.withOpacity(0.4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: companyState is ProductComanySelect
                                ? currentCompany.df_id == companyState.companyID
                                    ? Colors.green[400]!.withOpacity(0.4)
                                    : null
                                : null,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child:
                              CompanyCardView(currentCompany: currentCompany),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.green[600],
            ),
          );
        },
      ),
    );
  }
}
