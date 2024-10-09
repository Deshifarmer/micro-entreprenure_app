import 'package:flutter/widgets.dart';

class HomeIconModel {
  HomeIconModel({
    required this.title,
    this.painter,
    this.icon,
  });
  final String title;
  final CustomPainter? painter;
  final Icon? icon;
}
