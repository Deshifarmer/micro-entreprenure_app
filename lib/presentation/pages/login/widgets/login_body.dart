import 'package:deshifarmer/data/datasources/local/shared_prefs/local_database_sf.dart';
import 'package:deshifarmer/presentation/blocs/user_profile/user_profile_bloc.dart';
import 'package:deshifarmer/presentation/pages/home/bloc/bloc.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:deshifarmer/presentation/pages/order/bloc/order_bloc.dart';
import 'package:deshifarmer/presentation/shapes/deshifarmer_logo.dart';
import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:deshifarmer/presentation/widgets/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// {@template login_body}
/// Body of the LoginPage.
///
/// Add what it does
/// {@endtemplate}
class LoginBody extends StatelessWidget {
  /// {@macro login_body}
  LoginBody({super.key});
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Widget getDeshiFarmerLogo() => CustomPaint(
        painter: DeshifarmerLogo(),
        size: const Size(100, 100),
      );

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
          SharedPrefDBServices().setLoginToken(state.successLoginEntity.token);

          /// get my orders
          context
              .read<OrderBloc>()
              .add(InitOrders(state.successLoginEntity.token));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: primaryColor,
              content: Text('Successfully Logged In'),
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
        return Stack(
          children: [
            Positioned(
              right: -40,
              top: getProportionateScreenHeight(200),
              child: CircleAvatar(
                radius: getProportionateScreenWidth(80),
                backgroundColor: secondaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: getProportionateScreenHeight(
                        MediaQuery.sizeOf(context).height * 0.1,
                      ),
                      left: getProportionateScreenWidth(20),
                    ),
                    child: getDeshiFarmerLogo(),
                  ),

                  /// a space between logo and company name
                  SizedBox(
                    height: getProportionateScreenHeight(
                      MediaQuery.sizeOf(context).height * 0.25,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(5),
                    ),
                    child: Text(
                      'ক্ষুদ্র উদ্যোক্তা',
                      style: theme.textTheme.titleSmall!
                          .copyWith(color: const Color(0xffe9edde)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: getProportionateScreenHeight(20),
                    ),
                    child: Text(
                      'একাউন্ট ম্যানেজ করুন',
                      style: theme.textTheme.headlineSmall!.copyWith(
                        color: tertiaryColor2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ///! MOBILE NUMBER
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10),
                    ),
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      controller: _mobile,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        fillColor: tertiaryColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color(0xffe9edde),
                          ),
                        ),
                        hintText: 'মোবাইল নম্বর',

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color(0xffe9edde),
                          ),
                        ),
                        hintStyle: TextStyle(
                          color: Color(0xff787878),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        // inputer text color to white

                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        filled: true,
                      ),
                    ),
                  ),

                  /// password
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: getProportionateScreenHeight(10),
                    ),
                    child: PasswordTextField(password: _password),
                  ),

                  /// a row where a text button 'forget password' and anotehr button to sign in
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'পাসওয়ার্ড ভুলে গেছেন?',
                        style: TextStyle(
                          color: Color(0xff8dd22e),
                          // backgroundColor: textGreen,
                        ),
                      ),
                      ElevatedButton(
                        /// make this button background color textGreen
                        style: ElevatedButton.styleFrom(
                          backgroundColor: textGreen,

                          /// border radius to 15
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () async {
                          if (state is LoginLoading) {
                            return;
                          }
                          // print('mobile -> ${_mobile.text}');
                          // print('password -> ${_password.text}');
                          context.read<LoginBloc>().add(
                                CheckLoginEvent(
                                  context: context,
                                  // mail: '01896267197',
                                  // mail: 'nadia@gmail.com',
                                  mail: _mobile.text,
                                  // pass: 'df62me',
                                  // pass: '123456',
                                  // pass: 'password',
                                  pass: _password.text,
                                ),
                              );
                        },
                        child: state is LoginLoading
                            ? const Text(
                                'চেকিং  ....',
                              )
                                .animate(
                                  onPlay: (controller) => controller.repeat(),
                                )
                                .shimmer(
                                  duration: 500.milliseconds,
                                  color: primaryColor,
                                )
                            : const Text(
                                'লগইন করুন',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required TextEditingController password,
    super.key,
  }) : _password = password;

  final TextEditingController _password;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: widget._password,
      //     state is RecordSowingInitial ? state.unit : null,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        // fillColor: tertiaryColor,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xffe9edde),
          ),
        ),
        // suffixIcon: Icon(
        //   Icons.remove_red_eye,
        //   color: Colors.white,
        // ),
        /// suffix icon to toggle password visibility
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.white,
          ),
        ),
        hintText: 'পাসওয়ার্ড',
        hintStyle: const TextStyle(
          color: Color(0xff787878),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xffe9edde),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          borderSide: BorderSide(
            color: Color(0xffe9edde),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          // vertical: 20,
          horizontal: 15,
        ),
        // filled: true,
      ),
    );
  }
}
