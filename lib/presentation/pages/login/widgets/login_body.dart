import 'package:deshifarmer/core/params/login_page_params.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/home/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

/// {@template login_body}
/// Body of the LoginPage.
///
/// Add what it does
/// {@endtemplate}
class LoginBody extends StatelessWidget {
  /// {@macro login_body}
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // print('successfully logged in ${state.successLoginEntity.token}');
          context
              .read<UserProfileBloc>()
              .add(GetUserProfileEvent(token: state.successLoginEntity.token));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.green[700],
              content: const Text('Successfully Logged In'),
            ),
          );
        }
        if (state is LoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text('Login Failed'),
            ),
          );
        }
      },
      builder: (context, LoginState state) {
        return Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            // stacking image
            Center(
              child: Container(
                width: 100,
                height: 200,
                color: Colors.blue,
              ),
            ),
            // Company Name
            Text(
              LoginPageParams.companyName,
              style: theme.textTheme.titleSmall,
              textAlign: TextAlign.start,
            ),
            // a Title
            Text(
              LoginPageParams.title,
              style: theme.textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            // a form field for mail
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                  filled: true,
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // a form field for password
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  labelText: 'Password',
                ),
              ),
            ),

            // a row with text and a button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Forgot Password',
                  style: theme.textTheme.labelSmall!.copyWith(
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                if (state is LoginLoading)
                  CircularProgressIndicator(
                    color: Colors.green[600],
                  )
                else
                  ElevatedButton(
                    onPressed: () async {
                      context.read<LoginBloc>().add(
                            CheckLoginEvent(
                              context: context,
                              mail: '01896267197',
                              // mail: 'nadia@gmail.com',
                              pass: 'df62me',
                              // pass: '123456',
                            ),
                          );
                    },
                    child: const Text('Login'),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
