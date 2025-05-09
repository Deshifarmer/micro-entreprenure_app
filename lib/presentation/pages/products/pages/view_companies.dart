import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:deshifarmer/core/app_strings.dart';

import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/products/pages/view_company_product2.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/constraints.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/blocs/category/category_bloc.dart';
import 'package:deshifarmer/services/blocs/company/company_bloc.dart';
import 'package:flutter/material.dart';

class ViewAllComapnies extends StatelessWidget {
  const ViewAllComapnies({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: () async {
        final loginState = context.read<LoginBloc>().state;

        final token = loginState is LoginSuccess
            ? loginState.successLoginEntity.token
            : '';
        context.read<CompanyBloc>().add(
              CompanyFetchEvent(
                token,
              ),
            );

        ///! Category BLOCK
        context.read<CategoryBloc>().add(
              CategoryDataFetch(
                token,
              ),
            );

        ///! Fetch Products
        // context.read<ProductsBBloc>().add(
        //       ProductFFetchEvent(
        //         token,
        //       ),
        //     );

        return true;
      },
      child: Scaffold(
        /* context
                                .read<ProductsBloc>()
                                .add(const UnSelectCompanyEvent()); */
        backgroundColor: backgroundColor2,
        appBar: AppBar(
          backgroundColor: backgroundColor2,
          title: const Text(
            'সকল কোম্পানি ',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              /* Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Text(
                  'সকল কোম্পানি ',
                  // 'All companies',
                  style: textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), */
              /* Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          // disabledBorder: OutlineInputBorder(),
                          // focusedBorder: OutlineInputBorder(),
                          // errorBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // focusedErrorBorder: OutlineInputBorder(),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          prefixIcon:
                              const Icon(Icons.search, color: Color(0xff757575)),
                          hintText: 'পণ্যের নাম দিয়ে পণ্য সার্চ করুন ',
                          filled: true,
                          hintStyle: const TextStyle(
                            color: Color(0xff6a6a6a),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton.filled(
                    // highlightColor: Colors.red,
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(iconBackgroundColor),
                    ),
                    onPressed: () {
                      print('Dont press me, Sir!');
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: borderColor,
                    ),
                  ),
                ],
              ), */
              // const SizedBox(
              //   height: 20,
              // ),
              BlocConsumer<CompanyBloc, CompanyState>(
                listener: (context, state) {
                  if (state is CompanyFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Company Fetching Failed'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CompanySuccess) {
                    final allCompany = state.allCompanyListResp;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: allCompany.allCompany.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final currentCompany =
                            allCompany.allCompany.elementAt(index);
                        return OpenContainer(
                          closedBuilder:
                              (BuildContext context, void Function() action) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: getProportionateScreenHeight(50),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: checkDomain(
                                        Strings.getServerOrLocal(
                                          ServerOrLocal.server,
                                        ),
                                      )
                                          ? dummyImage
                                          : '${Strings.getServerOrLocal(ServerOrLocal.server)}/storage${currentCompany.photo}',
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              CircularProgressIndicator(
                                        value: downloadProgress.progress,
                                        color: Colors.green[600],
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    currentCompany.full_name ?? '',
                                    style: textTheme.bodySmall,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            );
                          },
                          openColor: backgroundColor2,
                          middleColor: backgroundColor2,
                          closedColor: backgroundColor2,
                          openElevation: 0,
                          closedElevation: 0,
                          openBuilder: (
                            BuildContext context,
                            void Function({Object? returnValue}) action,
                          ) {
                            final loginState = context.read<LoginBloc>().state;
                            final token = loginState is LoginSuccess
                                ? loginState.successLoginEntity.token
                                : '';
                            debugPrint(
                                'current company from allcompanygridview -> ${currentCompany.full_name}',);
                            // context.read<ProductsBBloc>().add(
                            //       ProductSearchEvent(
                            //         token,
                            //         company: currentCompany.df_id,
                            //         // query: productState.query,
                            //       ),
                            //     );

                            // context.read<ProductsBloc>().add(
                            //       SelectCompanysEvent(
                            //         currentCompany.df_id ?? '',
                            //       ),
                            //     );
                            // return CompanyProducts(
                            //   companyName: currentCompany.full_name ?? '',
                            //   companyID: currentCompany.df_id ?? '',
                            // );
                            return ViewCompanyProducts2(
                              token: token,
                              companyName: currentCompany.full_name ?? '',
                              companyID: currentCompany.df_id ?? '',
                            );
                          },
                        );
                      },
                    );
                  }
                  if (state is CompanyFailed) {
                    return const Center(
                      child: Text('Company Fetching Failed'),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
