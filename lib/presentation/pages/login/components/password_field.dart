import 'package:deshifarmer/presentation/pages/activity/activity.dart';
import 'package:deshifarmer/presentation/pages/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required TextEditingController mobile,
    required TextEditingController password,
    super.key,
  })  : _password = password,
        _mobile = mobile;

  final TextEditingController _password;
  final TextEditingController _mobile;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginBloc>().state;
    return TextField(
      obscureText: _obscureText,
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: widget._password,
      textInputAction: TextInputAction.done,
      onSubmitted: (value) async {
        if (state is LoginLoading) {
          return;
        }
        // print('mobile -> ${widget._mobile.text}');
        // print('password -> ${widget._password.text}');
        context.read<LoginBloc>().add(
              CheckLoginEvent(
                context: context,
                // mail: '01896267197',
                // mail: 'nadia@gmail.com',
                mail: widget._mobile.text,
                // pass: 'df62me',
                // pass: '123456',
                // pass: 'password',
                pass: widget._password.text,
              ),
            );
      },
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
