import 'package:deshifarmer/l10n/l10n.dart';
import 'package:deshifarmer/presentation/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/presentation/blocs/category/category_bloc.dart';
import 'package:deshifarmer/presentation/blocs/company/company_bloc.dart';
import 'package:deshifarmer/presentation/blocs/farmer_api/add_farmer_api_bloc.dart';
import 'package:deshifarmer/presentation/blocs/my_farmer/my_farmer_bloc.dart';
import 'package:deshifarmer/presentation/blocs/my_unassign_farmers/my_unassign_famers_bloc.dart';
import 'package:deshifarmer/presentation/blocs/products/products_bloc.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/cubit/add_group/add_farmer_to_group_cubit.dart';
import 'package:deshifarmer/presentation/cubit/dropdown/dropdown_cubit.dart';
import 'package:deshifarmer/presentation/cubit/groups/get_group_cubit.dart';
import 'package:deshifarmer/presentation/pages/add_farmer/add_farmer.dart';
import 'package:deshifarmer/presentation/pages/add_group/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/farmadd_form/bloc/farmadd_form_bloc.dart';
import 'package:deshifarmer/presentation/pages/group_detail/bloc/group_detail_bloc.dart';
import 'package:deshifarmer/presentation/pages/home/home.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/view/login_page.dart';
import 'package:deshifarmer/presentation/pages/order/order.dart';
import 'package:deshifarmer/presentation/pages/products/bloc/products_bloc.dart';
import 'package:deshifarmer/presentation/pages/profile/bloc/bloc.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //? LoginBloc
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(),
        ),
        //? HomeBloc
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(),
        ),
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
        BlocProvider<ProductsBBloc>(
          create: (BuildContext context) => ProductsBBloc(),
        ),
        //? product bloc
        BlocProvider<ProductsBloc>(
          create: (BuildContext context) => ProductsBloc(),
        ),
        //? Cart BLoc
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
        // DropdownCubit
        BlocProvider<DropdownForPaymentCubit>(
          create: (BuildContext context) => DropdownForPaymentCubit(),
        ),

        BlocProvider<SelectFarmerForPaymentCubit>(
          create: (BuildContext context) => SelectFarmerForPaymentCubit(),
        ),
        // MyFarmerBloc
        BlocProvider<MyFarmerBloc>(
          create: (BuildContext context) => MyFarmerBloc(),
        ),
        // add group form field CUBIT
        BlocProvider<GetGroupCubit>(
          create: (BuildContext context) => GetGroupCubit(),
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
      ],
      // create: (context) => SubjectBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.green,
            backgroundColor: Colors.white,
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LoginPage(),
      ),
    );
  }
}
