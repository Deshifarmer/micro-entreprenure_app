import 'dart:async';

import 'package:deshifarmer/data/datasources/local/shared_prefs/local_database_sf.dart';
import 'package:deshifarmer/l10n/l10n.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/add_group/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/bloc/agri_advisory_bloc.dart';
import 'package:deshifarmer/presentation/pages/agri_advisory/cubit/list_for_farmers_cubit.dart';
import 'package:deshifarmer/presentation/pages/attendance/bloc/attendance_bloc.dart';
import 'package:deshifarmer/presentation/pages/crop_insurance/bloc/crop_insurance_bloc.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/bloc/farmadd_form_bloc.dart';
import 'package:deshifarmer/presentation/pages/group_detail/bloc/group_detail_bloc.dart';
import 'package:deshifarmer/presentation/pages/home/home.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/view/login_page.dart';
import 'package:deshifarmer/presentation/pages/order/order.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/products_bloc.dart';
import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:deshifarmer/services/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/services/blocs/category/category_bloc.dart';
import 'package:deshifarmer/services/blocs/company/company_bloc.dart';
import 'package:deshifarmer/services/blocs/farmer_api/add_farmer_api_bloc.dart';
import 'package:deshifarmer/services/blocs/farmer_fetch_farm/farmer_fetch_farm_bloc.dart';
import 'package:deshifarmer/services/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/services/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/services/blocs/record_sowing/record_sowing_bloc.dart';
import 'package:deshifarmer/services/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/services/cubit/add_group/add_farmer_to_group_cubit.dart';
import 'package:deshifarmer/services/cubit/dropdown/dropdown_cubit.dart';
// import 'package:deshifarmer/services/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/services/cubit/product_search/search_products_cubit_cubit.dart';
import 'package:deshifarmer/services/cubit/select_pagi_farmer/select_paginated_farmer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MultiBlocProvider(
      providers: [
        //? LoginBloc
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        //? HomeBloc
        // BlocProvider<HomeBloc>(
        //   create: (BuildContext context) => HomeBloc(),
        // ),
        //? HomeBloc
        BlocProvider<UserProfileBloc>(
          create: (BuildContext context) => UserProfileBloc(),
        ),
        //? profile bloc
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => ProfileBloc(),
        ),
        //? order bloc
        BlocProvider<OrderBloc>(
          create: (BuildContext context) => OrderBloc(),
        ),
        //? company blco
        BlocProvider<CompanyBloc>(
          create: (BuildContext context) => CompanyBloc(),
        ),
        //? category bloc
        BlocProvider<CategoryBloc>(
          create: (BuildContext context) => CategoryBloc(),
        ),
        //? products bloc (1st)
        // BlocProvider<ProductsBBloc>(
        //   create: (BuildContext context) => ProductsBBloc(),
        // ),
        //? product bloc
        BlocProvider<ProductsBloc>(
          create: (BuildContext context) => ProductsBloc(),
        ),
        //? Cart BLoc
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
        // // DropdownCubit
        BlocProvider<DropdownForPaymentCubit>(
          create: (BuildContext context) => DropdownForPaymentCubit(),
        ),

        // BlocProvider<DropdownForFarmerCubit>(
        //   create: (BuildContext context) => DropdownForFarmerCubit(),
        // ),
        // MyFarmerBloc
        BlocProvider<MyFarmerBloc>(
          create: (BuildContext context) => MyFarmerBloc(),
        ),

//AddFarmerApiBloc

        BlocProvider<AddFarmerApiBloc>(
          create: (BuildContext context) => AddFarmerApiBloc(),
        ),
        // Addfarmer Form

        BlocProvider<AddFarmerBloc>(
          create: (BuildContext context) => AddFarmerBloc(),
        ),

        ///* My Unassing Farmer List
        BlocProvider<MyUnassignFamersBloc>(
          create: (BuildContext context) => MyUnassignFamersBloc(),
        ),
        // GroupDetailBloc detail
        BlocProvider<GroupDetailBloc>(
          create: (BuildContext context) => GroupDetailBloc(),
        ),

        /// add farmer to group cubit
        BlocProvider<AddFarmerToGroupCubit>(
          create: (BuildContext context) => AddFarmerToGroupCubit(),
        ),

        /// select farmer cubit
        BlocProvider<SelectPaginatedFarmerCubit>(
          create: (BuildContext context) => SelectPaginatedFarmerCubit(),
        ),

        /// update leader to group cubit
        BlocProvider<UpdateLeaderToGroupCubit>(
          create: (BuildContext context) => UpdateLeaderToGroupCubit(),
        ),
// AddGroupBloc

        BlocProvider<AddGroupBloc>(
          create: (BuildContext context) => AddGroupBloc(),
        ),
// FarmaddFormBloc

        BlocProvider<FarmaddFormBloc>(
          create: (BuildContext context) => FarmaddFormBloc(),
        ),
        // FarmerFetchFarmBloc
        BlocProvider<FarmerFetchFarmBloc>(
          create: (BuildContext context) => FarmerFetchFarmBloc(),
        ),
        // AttendanceBloc
        BlocProvider<AttendanceBloc>(
          create: (BuildContext context) => AttendanceBloc(),
        ),
        // AgriAdvisoryBloc
        BlocProvider<AgriAdvisoryBloc>(
          create: (BuildContext context) => AgriAdvisoryBloc(),
        ),

        /// SearchProductsCubitCubit
        BlocProvider<SearchProductsCubitCubit>(
          create: (BuildContext context) => SearchProductsCubitCubit(),
        ),

        /// activity bloc
        BlocProvider<ActivityBloc>(
          create: (BuildContext context) => ActivityBloc(),
        ),
        // CropInsuranceBloc
        BlocProvider<CropInsuranceBloc>(
          create: (BuildContext context) => CropInsuranceBloc(),
        ),
        // RecordSowingBloc
        BlocProvider<RecordSowingBloc>(
          create: (BuildContext context) => RecordSowingBloc(),
        ),
        // ListForFarmersCubit
        BlocProvider<ListForFarmersCubit>(
          create: (BuildContext context) => ListForFarmersCubit(),
        ),
      ],
      // create: (context) => SubjectBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            accentColor: primaryColor,
            backgroundColor: Colors.white,
          ),
          scaffoldBackgroundColor: backgroundColor2,
          inputDecorationTheme: const InputDecorationTheme(
            outlineBorder: BorderSide(
              color: primaryColor,
            ),
            floatingLabelStyle: TextStyle(
              color: primaryColor,
            ),
          ),
          snackBarTheme: const SnackBarThemeData(
            // actionBackgroundColor: primaryColor,
            backgroundColor: primaryColor,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: backgroundColor2,
            surfaceTintColor: backgroundColor2,
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: primaryColor,
          ),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: primaryColor,
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: UpgradeAlert(
          child: const MyHomePagu(),
        ),
      ),
    );
  }
}

class MyHomePagu extends StatefulWidget {
  const MyHomePagu({
    super.key,
  });

  @override
  State<MyHomePagu> createState() => _MyHomePaguState();
}

class _MyHomePaguState extends State<MyHomePagu> {
  late Future<String?> getLoginTokenFromDB;
  @override
  void initState() {
    debugPrint('how many times the app gets called APP->MyHomePage->initState');
    getLoginTokenFromDB = SharedPrefDBServices().getLoginToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getLoginTokenFromDB,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            debugPrint('Calling Userprofile and Order from APP :)');

            /// a login success event
            context
                .read<LoginBloc>()
                .add(LoginSuccessEvent(token: snapshot.data!));

            /// get user profile
            context
                .read<UserProfileBloc>()
                .add(GetUserProfileEvent(token: snapshot.data!));

            /// get my orders
            context.read<OrderBloc>().add(InitOrders(snapshot.data!));
            return const HomePage();
          }
        }
        return const LoginPage();
      },
    );
  }
}
