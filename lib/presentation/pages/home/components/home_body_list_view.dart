import 'package:deshifarmer/core/app_strings.dart';
import 'package:deshifarmer/core/params/home_page_params.dart';
import 'package:deshifarmer/domain/entities/user_entity/user_profile_entity.dart';
import 'package:deshifarmer/presentation/animations/page_animations.dart';
import 'package:deshifarmer/presentation/blocs/category/category_bloc.dart';
import 'package:deshifarmer/presentation/blocs/company/company_bloc.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/presentation/blocs/products/products_bloc.dart';
import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/view/add_farmer_page.dart';
import 'package:deshifarmer/presentation/pages/add_group/view/add_group_page.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/view/farmer_listo_page.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/products/view/products_page.dart';
import 'package:flutter/material.dart';

class HomeBodyListView extends StatelessWidget {
  const HomeBodyListView({
    required this.usrProfile,
    super.key,
  });

  final UserProfileEntity usrProfile;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 60,
        ),
        // circular avater
        if (usrProfile.photo != null)
          Padding(
            padding: const EdgeInsets.all(8),
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
              print('$i ${HomePageParams.categories.elementAt(i)}');
              final logINState = context.read<LoginBloc>().state;

              if (logINState is LoginSuccess) {
                print(logINState.successLoginEntity.token);

                if (i == 4) {
                  context.read<GetGroupCubit>().addAllGroupFields(
                        logINState.successLoginEntity.token,
                      );
                  // ignore: use_build_context_synchronously
                  Navigator.push(context, AddFarmerPage.route());
                } else if (i == 3) {
                  context.read<MyFarmerBloc>().add(
                        MyFarmerFetchEvent(
                          logINState.successLoginEntity.token,
                        ),
                      );
                  Navigator.push(
                    context,
                    PageAnimationWrapper.sharedAxisTransitionPageWrapper(
                      const FarmerListoPage(),
                    ),
                  );
                } else if (i == 5) {
                  context.read<GetGroupCubit>().addAllGroupFields(
                        logINState.successLoginEntity.token,
                      );
// MyUnassignFamersBloc

                  context.read<MyUnassignFamersBloc>().add(
                        MyUnassignFarmerFetchEvent(
                          logINState.successLoginEntity.token,
                        ),
                      );
                  Navigator.push(context, AddGroupPage.route());
                } else if (i == 0) {
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
                  // ProductsPage.route();
                  Navigator.push(context, ProductsPage.route());
                }
              }
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
}
