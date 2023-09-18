//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/rendering.dart';

class CommisionShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.8375000, size.height * 0.1250000);
    path_0.lineTo(size.width * 0.1625000, size.height * 0.1250000);
    path_0.cubicTo(
        size.width * 0.1416667,
        size.height * 0.1250000,
        size.width * 0.1250000,
        size.height * 0.1416667,
        size.width * 0.1250000,
        size.height * 0.1625000);
    path_0.lineTo(size.width * 0.1250000, size.height * 0.8375000);
    path_0.cubicTo(
        size.width * 0.1250000,
        size.height * 0.8541667,
        size.width * 0.1416667,
        size.height * 0.8750000,
        size.width * 0.1625000,
        size.height * 0.8750000);
    path_0.lineTo(size.width * 0.8375000, size.height * 0.8750000);
    path_0.cubicTo(
        size.width * 0.8541667,
        size.height * 0.8750000,
        size.width * 0.8750000,
        size.height * 0.8541667,
        size.width * 0.8750000,
        size.height * 0.8375000);
    path_0.lineTo(size.width * 0.8750000, size.height * 0.1625000);
    path_0.cubicTo(
        size.width * 0.8750000,
        size.height * 0.1416667,
        size.width * 0.8541667,
        size.height * 0.1250000,
        size.width * 0.8375000,
        size.height * 0.1250000);
    path_0.close();
    path_0.moveTo(size.width * 0.3750000, size.height * 0.2916667);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.2916667);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.3750000);
    path_0.lineTo(size.width * 0.3750000, size.height * 0.3750000);
    path_0.lineTo(size.width * 0.3750000, size.height * 0.2916667);
    path_0.close();
    path_0.moveTo(size.width * 0.7083333, size.height * 0.2916667);
    path_0.lineTo(size.width * 0.4583333, size.height * 0.2916667);
    path_0.lineTo(size.width * 0.4583333, size.height * 0.3750000);
    path_0.lineTo(size.width * 0.7083333, size.height * 0.3750000);
    path_0.lineTo(size.width * 0.7083333, size.height * 0.2916667);
    path_0.close();
    path_0.moveTo(size.width * 0.7083333, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.4583333, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.4583333, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.7083333, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.7083333, size.height * 0.4583333);
    path_0.close();
    path_0.moveTo(size.width * 0.4583333, size.height * 0.6250000);
    path_0.lineTo(size.width * 0.7083333, size.height * 0.6250000);
    path_0.lineTo(size.width * 0.7083333, size.height * 0.7083333);
    path_0.lineTo(size.width * 0.4583333, size.height * 0.7083333);
    path_0.lineTo(size.width * 0.4583333, size.height * 0.6250000);
    path_0.close();
    path_0.moveTo(size.width * 0.2916667, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.3750000, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.3750000, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.4583333);
    path_0.close();
    path_0.moveTo(size.width * 0.3750000, size.height * 0.6250000);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.6250000);
    path_0.lineTo(size.width * 0.2916667, size.height * 0.7083333);
    path_0.lineTo(size.width * 0.3750000, size.height * 0.7083333);
    path_0.lineTo(size.width * 0.3750000, size.height * 0.6250000);
    path_0.close();
    path_0.moveTo(size.width * 0.2083333, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.7916667);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffF2994A).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
