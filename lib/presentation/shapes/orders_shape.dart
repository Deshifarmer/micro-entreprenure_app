//Copy this CustomPainter code to the Bottom of the File
import 'package:flutter/material.dart';

class OrdersShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.1875000, size.height * 0.3333333);
    path_0.lineTo(size.width * 0.1458333, size.height * 0.3333333);
    path_0.lineTo(size.width * 0.1458333, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.1666667);
    path_0.lineTo(size.width * 0.1875000, size.height * 0.1666667);
    path_0.lineTo(size.width * 0.1875000, size.height * 0.3333333);
    path_0.close();
    path_0.moveTo(size.width * 0.1875000, size.height * 0.7291667);
    path_0.lineTo(size.width * 0.1875000, size.height * 0.7083333);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.7083333);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.6666667);
    path_0.lineTo(size.width * 0.2291667, size.height * 0.6666667);
    path_0.lineTo(size.width * 0.2291667, size.height * 0.8333333);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.8333333);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.1875000, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.1875000, size.height * 0.7708333);
    path_0.lineTo(size.width * 0.1458333, size.height * 0.7708333);
    path_0.lineTo(size.width * 0.1458333, size.height * 0.7291667);
    path_0.lineTo(size.width * 0.1875000, size.height * 0.7291667);
    path_0.close();
    path_0.moveTo(size.width * 0.1041667, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.1791667, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.5458333);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.5833333);
    path_0.lineTo(size.width * 0.2291667, size.height * 0.5833333);
    path_0.lineTo(size.width * 0.2291667, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.1541667, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.2291667, size.height * 0.4541667);
    path_0.lineTo(size.width * 0.2291667, size.height * 0.4166667);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.4166667);
    path_0.lineTo(size.width * 0.1041667, size.height * 0.4583333);
    path_0.close();
    path_0.moveTo(size.width * 0.3125000, size.height * 0.2916667);
    path_0.lineTo(size.width * 0.3125000, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.8958333, size.height * 0.2083333);
    path_0.lineTo(size.width * 0.8958333, size.height * 0.2916667);
    path_0.lineTo(size.width * 0.3125000, size.height * 0.2916667);
    path_0.close();
    path_0.moveTo(size.width * 0.3125000, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.8958333, size.height * 0.7916667);
    path_0.lineTo(size.width * 0.8958333, size.height * 0.7083333);
    path_0.lineTo(size.width * 0.3125000, size.height * 0.7083333);
    path_0.lineTo(size.width * 0.3125000, size.height * 0.7916667);
    path_0.close();
    path_0.moveTo(size.width * 0.8958333, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.3125000, size.height * 0.5416667);
    path_0.lineTo(size.width * 0.3125000, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.8958333, size.height * 0.4583333);
    path_0.lineTo(size.width * 0.8958333, size.height * 0.5416667);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.black.withOpacity(0.54);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
