import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

SnackBar errorSnackBar(String msg) => SnackBar(
      backgroundColor: Colors.red,
      content: Text(msg),
      behavior: SnackBarBehavior.floating,
    );
SnackBar successSnackBar(String msg) => SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: primaryColor,
      content: Text(msg),
    );
