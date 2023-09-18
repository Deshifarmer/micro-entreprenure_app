import 'package:flutter/rendering.dart';

class AgriAdvisoryShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.8333333, size.height * 0.08333333);
    path_0.lineTo(size.width * 0.1666667, size.height * 0.08333333);
    path_0.cubicTo(
        size.width * 0.1208333,
        size.height * 0.08333333,
        size.width * 0.08333333,
        size.height * 0.1208333,
        size.width * 0.08333333,
        size.height * 0.1666667,);
    path_0.lineTo(size.width * 0.08333333, size.height * 0.6666667);
    path_0.cubicTo(
        size.width * 0.08333333,
        size.height * 0.7125000,
        size.width * 0.1208333,
        size.height * 0.7500000,
        size.width * 0.1666667,
        size.height * 0.7500000,);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.7500000);
    path_0.lineTo(size.width * 0.9166667, size.height * 0.9166667);
    path_0.lineTo(size.width * 0.9166667, size.height * 0.1666667);
    path_0.cubicTo(
        size.width * 0.9166667,
        size.height * 0.1208333,
        size.width * 0.8791667,
        size.height * 0.08333333,
        size.width * 0.8333333,
        size.height * 0.08333333,);
    path_0.close();
    path_0.moveTo(size.width * 0.8333333, size.height * 0.1666667);
    path_0.lineTo(size.width * 0.8333333, size.height * 0.7154167);
    path_0.lineTo(size.width * 0.7845833, size.height * 0.6666667);
    path_0.lineTo(size.width * 0.1666667, size.height * 0.6666667);
    path_0.lineTo(size.width * 0.1666667, size.height * 0.1666667);
    path_0.lineTo(size.width * 0.8333333, size.height * 0.1666667);
    path_0.close();
    path_0.moveTo(size.width * 0.2500000, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.5833333);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.5833333);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.5000000);
    path_0.close();
    path_0.moveTo(size.width * 0.7500000, size.height * 0.3750000);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.3750000);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.3750000);
    path_0.close();
    path_0.moveTo(size.width * 0.2500000, size.height * 0.2500000);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.2500000);
    path_0.lineTo(size.width * 0.7500000, size.height * 0.3333333);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.3333333);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.2500000);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff9B51E0).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
