//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/rendering.dart';

class PerformaceShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.4416667, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.5583333, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.5583333, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.4416667, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.4416667, size.height * 0.2083333);
    path_0.close();
    path_0.moveTo(size.width * 0.2083333, size.height * 0.3833333);
    path_0.lineTo(size.width * 0.3333333, size.height * 0.3833333);
    path_0.lineTo(size.width * 0.3333333, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.3833333);
    path_0.close();
    path_0.moveTo(size.width * 0.7916667, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.6750000, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.6750000, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.5416667);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffFF9403).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
