import 'package:flutter/rendering.dart';

class CropInsuranceShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.5000000, size.height * 0.04166667);
    path_0.lineTo(size.width * 0.1250000, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.1250000, size.height * 0.4583333);
    path_0.cubicTo(
        size.width * 0.1250000,
        size.height * 0.6895833,
        size.width * 0.2850000,
        size.height * 0.9058333,
        size.width * 0.5000000,
        size.height * 0.9583333,);
    path_0.cubicTo(
        size.width * 0.7150000,
        size.height * 0.9058333,
        size.width * 0.8750000,
        size.height * 0.6895833,
        size.width * 0.8750000,
        size.height * 0.4583333,);
    path_0.lineTo(size.width * 0.8750000, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.04166667);
    path_0.close();
    path_0.moveTo(size.width * 0.7916667, size.height * 0.4583333);
    path_0.cubicTo(
        size.width * 0.7916667,
        size.height * 0.6466667,
        size.width * 0.6675000,
        size.height * 0.8204167,
        size.width * 0.5000000,
        size.height * 0.8720833,);
    path_0.cubicTo(
        size.width * 0.3325000,
        size.height * 0.8204167,
        size.width * 0.2083333,
        size.height * 0.6466667,
        size.width * 0.2083333,
        size.height * 0.4583333,);
    path_0.lineTo(size.width * 0.2083333, size.height * 0.2625000);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.1329167);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.2625000);
    path_0.lineTo(size.width * 0.7916667, size.height * 0.4583333);
    path_0.close();
    path_0.moveTo(size.width * 0.2500000, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.3087500, size.height * 0.4829167);
    path_0.lineTo(size.width * 0.4166667, size.height * 0.5904167);
    path_0.lineTo(size.width * 0.6912500, size.height * 0.3158333);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.3750000);
    path_0.lineTo(size.width * 0.4166667, size.height * 0.7083333);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.5416667);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff2F80ED).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
