import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.passwordController,
    super.key,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isShowing = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: widget.passwordController,
      keyboardType: TextInputType.text,
      obscureText: isShowing,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        // icon: Icon(Icons.password),
        // prefix: Icon(Icons.password),
        suffix: InkWell(
          onTap: () {
            setState(() {
              isShowing = !isShowing;
            });
          },
          child: Icon(
            Icons.password,
            color: isShowing ? Colors.white : primaryColor,
          ),
        ),
        fillColor: tertiaryColor,
        filled: true,
        labelText: 'পাসওয়ার্ড',
        labelStyle: const TextStyle(
          color: textGrey,
        ),
      ),
    );
  }
}
