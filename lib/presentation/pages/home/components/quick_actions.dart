import 'package:deshifarmer/core/params/home_page_params.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/add_group/add_group.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/agri_advisory.dart';
import 'package:deshifarmer/presentation/pages/commision/commision.dart';
import 'package:deshifarmer/presentation/pages/crop_insurance/view/crop_insurance_page.dart';
import 'package:deshifarmer/presentation/pages/demands/demands.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/view/farmadd_form_page.dart';
import 'package:deshifarmer/presentation/pages/farmer_listo/farmer_listo.dart';
import 'package:deshifarmer/presentation/pages/harvest/harvest.dart';
import 'package:deshifarmer/presentation/pages/kpi/kpi.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/logistic/logistic.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/view/order_page.dart';
import 'package:deshifarmer/presentation/pages/products/view/products_page.dart';
import 'package:deshifarmer/presentation/widgets/home_page_icon_widget.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/blocs/category/category_bloc.dart';
import 'package:deshifarmer/services/blocs/company/company_bloc.dart';
import 'package:deshifarmer/services/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/services/cubit/groups/get_group_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: getProportionateScreenHeight(230),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(
              20,
            ),
          ),
          child: PageView.builder(
            itemCount: 2,
            itemBuilder: (context, int lindex) {
              if (lindex == 0) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    // mainAxisExtent: getProportionateScreenHeight(100),
                  ),
                  itemCount: 8,
                  itemBuilder: (context, int index) {
                    final currentIcon =
                        HomePageParams.homePageIconDatas1st.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        final loginState = context.read<LoginBloc>().state;
                        final token = loginState is LoginSuccess
                            ? loginState.successLoginEntity.token
                            : '';
                        debugPrint('tapped on $index');
                        switch (currentIcon.title) {
                          case 'কৃষি ইন্সুরেন্স':
                            // CropInsurancePage.route();
                            Navigator.push(context, CropInsurancePage.route());
                          case 'কৃষি পরামর্শ':
                            Navigator.push(
                              context,
                              AgriAdvisoryPage.route(),
                            );
                          case 'আমার কৃষক':
                            if (loginState is LoginSuccess) {
                              context.read<MyFarmerBloc>().add(
                                  MyFarmerFetchEvent(
                                      loginState.successLoginEntity.token,),);
                            }
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => const Material(
                                  child: FarmerListoPage(
                                    isBack: true,
                                  ),
                                ),
                              ),
                            );
                          case 'ফার্ম যোগ':
                            context.read<MyFarmerBloc>().add(
                                  MyFarmerFetchEvent(
                                    token,
                                  ),
                                );
                            Navigator.push(
                              context,
                              FarmaddFormPage.route(),
                            );
                          case 'পারফরমেন্স':
                            Navigator.push(
                              context,
                              KpiPage.route(),
                            );
                          case 'কৃষি ইনপুট':
                            //? fetching the category data
                            context
                                .read<CategoryBloc>()
                                .add(CategoryDataFetch(token));
                            //? fetching the company data
                            context
                                .read<CompanyBloc>()
                                .add(CompanyFetchEvent(token));
                            // fetch the products data
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => const ProductsPage(),
                                // builder: (_) => ProductsBody3(token: token),
                                // ProductsBody3
                              ),
                            );
                          case 'অর্ডার তালিকা':
                            // OrderBloc
                            context.read<OrderBloc>().add(
                                  InitOrders(
                                    token,
                                  ),
                                );
                            Navigator.push(
                              context,
                              OrderPage.route(),
                            );
                          case 'ট্র্যাক করুন':
                            Navigator.push(
                              context,
                              ActivityPage.route(),
                            );
                          default:
                        }
                      },
                      child: HomePageIconWidget(
                        title: currentIcon.title,
                        painter: currentIcon.painter,
                        icon: currentIcon.icon,
                      ),
                    );
                  },
                );
              } else {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    // crossAxisSpacing: 0,
                    // mainAxisSpacing: 0,
                    // mainAxisExtent: getProportionateScreenHeight(120),
                  ),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    final currentIcon =
                        HomePageParams.homePageIconDatas2nd.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        switch (currentIcon.title) {
                          case 'বাজার চাহিদা':
                            Navigator.push(
                              context,
                              DemandsPage.route(),
                            );
                          case 'লজিস্টিক':
                            Navigator.push(
                              context,
                              LogisticPage.route(),
                            );
                          case 'গ্রুপ':
                            final loginState = context.read<LoginBloc>().state;
                            final token = loginState is LoginSuccess
                                ? loginState.successLoginEntity.token
                                : '';
                            // GetGroupCubit
                            context.read<GetGroupCubit>().addAllGroupFields(
                                  token,
                                );
                            Navigator.push(
                              context,
                              AddGroupPage.route(),
                            );
                          case 'কমিশন':
                            Navigator.push(
                              context,
                              CommisionPage.route(),
                            );
                          case 'ফসল':
                            Navigator.push(
                              context,
                              HarvestPage.route(),
                            );
                          case 'সার্ভে':
                            final url =
                                Uri.parse('https://me.deshifarmer.co/survey');
                            launchUrl(url);
                          case 'নিরাপদ উৎপাদন':
                            final url = Uri.parse(
                              'https://me.deshifarmer.co/safe-production',
                            );
                            launchUrl(url);
                          default:
                        }
                        // debugPrint('tapped on $index');
                      },
                      child: HomePageIconWidget(
                        title: currentIcon.title,
                        painter: currentIcon.painter,
                        icon: currentIcon.icon,
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
