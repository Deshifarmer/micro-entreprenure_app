//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/rendering.dart';

class ServayShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.7916667, size.height * 0.1250000);
    path_0.lineTo(size.width * 0.6175000, size.height * 0.1250000);
    path_0.cubicTo(
        size.width * 0.6000000,
        size.height * 0.07666667,
        size.width * 0.5541667,
        size.height * 0.04166667,
        size.width * 0.5000000,
        size.height * 0.04166667);
    path_0.cubicTo(
        size.width * 0.4458333,
        size.height * 0.04166667,
        size.width * 0.4000000,
        size.height * 0.07666667,
        size.width * 0.3825000,
        size.height * 0.1250000);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.1250000);
    path_0.cubicTo(
        size.width * 0.1625000,
        size.height * 0.1250000,
        size.width * 0.1250000,
        size.height * 0.1625000,
        size.width * 0.1250000,
        size.height * 0.2083333);
    path_0.lineTo(size.width * 0.1250000, size.height * 0.8750000);
    path_0.cubicTo(
        size.width * 0.1250000,
        size.height * 0.9208333,
        size.width * 0.1625000,
        size.height * 0.9583333,
        size.width * 0.2083333,
        size.height * 0.9583333);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.9583333);
    path_0.cubicTo(
        size.width * 0.8375000,
        size.height * 0.9583333,
        size.width * 0.8750000,
        size.height * 0.9208333,
        size.width * 0.8750000,
        size.height * 0.8750000);
    path_0.lineTo(size.width * 0.8750000, size.height * 0.2083333);
    path_0.cubicTo(
        size.width * 0.8750000,
        size.height * 0.1625000,
        size.width * 0.8375000,
        size.height * 0.1250000,
        size.width * 0.7916667,
        size.height * 0.1250000);
    path_0.close();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.1250000);
    path_0.cubicTo(
        size.width * 0.5229167,
        size.height * 0.1250000,
        size.width * 0.5416667,
        size.height * 0.1437500,
        size.width * 0.5416667,
        size.height * 0.1666667);
    path_0.cubicTo(
        size.width * 0.5416667,
        size.height * 0.1895833,
        size.width * 0.5229167,
        size.height * 0.2083333,
        size.width * 0.5000000,
        size.height * 0.2083333);
    path_0.cubicTo(
        size.width * 0.4770833,
        size.height * 0.2083333,
        size.width * 0.4583333,
        size.height * 0.1895833,
        size.width * 0.4583333,
        size.height * 0.1666667);
    path_0.cubicTo(
        size.width * 0.4583333,
        size.height * 0.1437500,
        size.width * 0.4770833,
        size.height * 0.1250000,
        size.width * 0.5000000,
        size.height * 0.1250000);
    path_0.close();
    path_0.moveTo(size.width * 0.2083333, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.8750000);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.8750000);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.7083333, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.7083333, size.height * 0.3333333);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.3333333);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.2083333);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff9B51E0).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
