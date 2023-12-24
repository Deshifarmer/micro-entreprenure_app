import 'package:flutter/material.dart';

class ErrorButtonGreen extends StatelessWidget {
  const ErrorButtonGreen({
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
            backgroundColor: MaterialStatePropertyAll(
              btnColor ?? Colors.red,
            ),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),),),),
        onPressed: onpress,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
