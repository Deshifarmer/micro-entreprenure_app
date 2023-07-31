import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/core/params/home_page_params.dart';
import 'package:deshifarmer/presentation/blocs/category/category_bloc.dart';
import 'package:deshifarmer/presentation/blocs/company/company_bloc.dart';
import 'package:deshifarmer/presentation/blocs/products/products_bloc.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/products/products.dart';
import 'package:flutter/material.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, state) {
        if (state is UserProfileFetchSuccess) {
          final usrProfile = state.userProfile;
          return ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              // circular avater
              if (usrProfile.photo != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(
                        100,
                      ), // Image radius
                      child: Image.network(
                        '${Strings.domain}/storage${usrProfile.photo}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              // CircleAvatar(
              //   radius: 75,
              //   child: Image.network(
              //     '${Strings.domain}/storage${usrProfile.photo}',
              //     // fit: BoxFit.fill,
              //   ),
              // )
              else
                const SizedBox.shrink(),
              // row -> name , balance
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Welcome ${usrProfile.full_name}'),
                    Text('BDT ${usrProfile.account_details.first.net_balance}'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // row -> day , checked in
              const Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Today'),
                    Text('checked in'),
                  ],
                ),
              ),
              // some graph
              Container(
                margin: const EdgeInsets.all(10),
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
              // gridview of card
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 80,
                ),
                itemCount: HomePageParams.categories.length,
                itemBuilder: (c, i) => InkWell(
                  onTap: () async {
                    final logINState = context.read<LoginBloc>().state;

                    if (logINState is LoginSuccess) {
                      print(logINState.successLoginEntity.token);

                      ///! company BLOCK
                      context.read<CompanyBloc>().add(
                            CompanyFetchEvent(
                              logINState.successLoginEntity.token,
                            ),
                          );

                      ///! Category BLOCK
                      context.read<CategoryBloc>().add(
                            CategoryDataFetch(
                              logINState.successLoginEntity.token,
                            ),
                          );

                      ///! Fetch Products
                      context.read<ProductsBBloc>().add(
                            ProductFetchEvent(
                              logINState.successLoginEntity.token,
                            ),
                          );
                    }
                    // ProductsPage.route();
                    await Navigator.push(context, ProductsPage.route());
                  },
                  child: Card(
                    color: Colors.greenAccent,
                    child: Center(
                      child: Text(
                        HomePageParams.categories.elementAt(i),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
        if (state is UserProfileFetchFailed) {
          return const Center(
            child: Text('Data Fetching failed'),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.green[600],
          ),
        );
      },
    );
  }
}
