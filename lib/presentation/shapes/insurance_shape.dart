import 'package:flutter/material.dart';

class InsuranceShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7916667, size.height * 0.04166667);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.04166667);
    path_0.cubicTo(
        size.width * 0.1625000,
        size.height * 0.04166667,
        size.width * 0.1254167,
        size.height * 0.07916667,
        size.width * 0.1254167,
        size.height * 0.1250000);
    path_0.lineTo(size.width * 0.1250000, size.height * 0.6637500);
    path_0.cubicTo(
        size.width * 0.1250000,
        size.height * 0.6925000,
        size.width * 0.1395833,
        size.height * 0.7179167,
        size.width * 0.1616667,
        size.height * 0.7329167);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.9583333);
    path_0.lineTo(size.width * 0.8379167, size.height * 0.7329167);
    path_0.cubicTo(
        size.width * 0.8600000,
        size.height * 0.7179167,
        size.width * 0.8745833,
        size.height * 0.6925000,
        size.width * 0.8745833,
        size.height * 0.6637500);
    path_0.lineTo(size.width * 0.8750000, size.height * 0.1250000);
    path_0.cubicTo(
        size.width * 0.8750000,
        size.height * 0.07916667,
        size.width * 0.8375000,
        size.height * 0.04166667,
        size.width * 0.7916667,
        size.height * 0.04166667);
    path_0.close();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.8583333);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.6641667);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.1250000);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.1250000);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.6637500);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.8583333);
    path_0.close();
    path_0.moveTo(size.width * 0.3087500, size.height * 0.4412500);
    path_0.lineTo(size.width * 0.4162500, size.height * 0.5491667);
    path_0.lineTo(size.width * 0.6908333, size.height * 0.2741667);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.3333333);
    path_0.lineTo(size.width * 0.4166667, size.height * 0.6666667);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.3087500, size.height * 0.4412500);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff01543B).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
