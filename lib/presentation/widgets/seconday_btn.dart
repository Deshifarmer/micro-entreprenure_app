import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

class SecondayButtonGreen extends StatelessWidget {
  const SecondayButtonGreen({
    required this.onpress,
    required this.title,
    this.btnColor,
    super.key,
  });

  final String title;
  final void Function()? onpress;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(btnColor ?? priceBoxColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onpress,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class ErrorButtonRed extends StatelessWidget {
  const ErrorButtonRed({
    required this.onpress,
    required this.title,
    this.btnColor,
    super.key,
  });

  final String title;
  final void Function()? onpress;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(
            Color(0xffFF4D4D),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onpress,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
