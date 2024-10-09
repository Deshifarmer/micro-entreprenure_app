import 'package:flutter/material.dart';

class PrimaryButtonGreen extends StatelessWidget {
  const PrimaryButtonGreen({
    required this.onpress,
    required this.title,
    super.key,
  });

  final String title;
  final void Function()? onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.green[600]),
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
