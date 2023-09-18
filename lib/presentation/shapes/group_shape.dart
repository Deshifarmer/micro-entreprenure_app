//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/material.dart';

class GroupShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.6250000, size.height * 0.1666667);
    path_0.cubicTo(
        size.width * 0.4408333,
        size.height * 0.1666667,
        size.width * 0.2916667,
        size.height * 0.3158333,
        size.width * 0.2916667,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.2916667,
        size.height * 0.6841667,
        size.width * 0.4408333,
        size.height * 0.8333333,
        size.width * 0.6250000,
        size.height * 0.8333333);
    path_0.cubicTo(
        size.width * 0.8091667,
        size.height * 0.8333333,
        size.width * 0.9583333,
        size.height * 0.6841667,
        size.width * 0.9583333,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.9583333,
        size.height * 0.3158333,
        size.width * 0.8091667,
        size.height * 0.1666667,
        size.width * 0.6250000,
        size.height * 0.1666667);
    path_0.close();
    path_0.moveTo(size.width * 0.6250000, size.height * 0.7500000);
    path_0.cubicTo(
        size.width * 0.4870833,
        size.height * 0.7500000,
        size.width * 0.3750000,
        size.height * 0.6379167,
        size.width * 0.3750000,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.3750000,
        size.height * 0.3620833,
        size.width * 0.4870833,
        size.height * 0.2500000,
        size.width * 0.6250000,
        size.height * 0.2500000);
    path_0.cubicTo(
        size.width * 0.7629167,
        size.height * 0.2500000,
        size.width * 0.8750000,
        size.height * 0.3620833,
        size.width * 0.8750000,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.8750000,
        size.height * 0.6379167,
        size.width * 0.7629167,
        size.height * 0.7500000,
        size.width * 0.6250000,
        size.height * 0.7500000);
    path_0.close();
    path_0.moveTo(size.width * 0.2916667, size.height * 0.2645833);
    path_0.cubicTo(
        size.width * 0.1945833,
        size.height * 0.2987500,
        size.width * 0.1250000,
        size.height * 0.3912500,
        size.width * 0.1250000,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.1250000,
        size.height * 0.6087500,
        size.width * 0.1945833,
        size.height * 0.7012500,
        size.width * 0.2916667,
        size.height * 0.7354167);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.8225000);
    path_0.cubicTo(
        size.width * 0.1479167,
        size.height * 0.7854167,
        size.width * 0.04166667,
        size.height * 0.6554167,
        size.width * 0.04166667,
        size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.04166667,
        size.height * 0.3445833,
        size.width * 0.1479167,
        size.height * 0.2145833,
        size.width * 0.2916667,
        size.height * 0.1775000);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.2645833);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.black.withOpacity(0.54);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
