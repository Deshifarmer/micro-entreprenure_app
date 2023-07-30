import 'package:deshifarmer/l10n/l10n.dart';
import 'package:deshifarmer/presentation/blocs/cart/cart_bloc.dart';
import 'package:deshifarmer/presentation/blocs/category/category_bloc.dart';
import 'package:deshifarmer/presentation/blocs/company/company_bloc.dart';
import 'package:deshifarmer/presentation/blocs/products/products_bloc.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/cubit/dropdown_cubit.dart';
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
        BlocProvider<DropdownCubit>(
          create: (BuildContext context) => DropdownCubit(),
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
          // appBarTheme: AppBarTheme(
          //   backgroundColor: Colors.green[200],
          // ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const LoginPage(),
      ),
    );
  }
}
