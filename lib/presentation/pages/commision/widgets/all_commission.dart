import 'dart:io';

import 'package:deshifarmer/core/params/api_database_params.dart';
import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AllCommissionBox extends StatelessWidget {
  const AllCommissionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final loginState = context.watch<LoginBloc>().state;
    final token =
        loginState is LoginSuccess ? loginState.successLoginEntity.token : '';
    return FutureBuilder(
      future: http.get(
        Uri.parse(ApiDatabaseParams.comissionAPI),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      ),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
        );
      },
    );
  }
}
