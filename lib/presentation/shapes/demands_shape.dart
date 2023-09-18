import 'package:flutter/material.dart';

class DemandShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.7683552, size.height * 0.1720833);
    path_0.lineTo(size.width * 0.8362724, size.height * 0.1041667);
    path_0.cubicTo(
        size.width * 0.9991897,
        size.height * 0.2729167,
        size.width * 0.9987724,
        size.height * 0.5254148,
        size.width * 0.8362724,
        size.height * 0.6875000);
    path_0.lineTo(size.width * 0.7683552, size.height * 0.6195852);
    path_0.cubicTo(
        size.width * 0.8837724,
        size.height * 0.4870815,
        size.width * 0.8837724,
        size.height * 0.2979167,
        size.width * 0.7683552,
        size.height * 0.1720833);
    path_0.close();
    path_0.moveTo(size.width * 0.5416897, size.height * 0.3958333);
    path_0.cubicTo(
        size.width * 0.5416897,
        size.height * 0.4879148,
        size.width * 0.4671069,
        size.height * 0.5625000,
        size.width * 0.3750241,
        size.height * 0.5625000);
    path_0.cubicTo(
        size.width * 0.2829390,
        size.height * 0.5625000,
        size.width * 0.2083559,
        size.height * 0.4879148,
        size.width * 0.2083559,
        size.height * 0.3958333);
    path_0.cubicTo(
        size.width * 0.2083559,
        size.height * 0.3037500,
        size.width * 0.2829390,
        size.height * 0.2291667,
        size.width * 0.3750241,
        size.height * 0.2291667);
    path_0.cubicTo(
        size.width * 0.4671069,
        size.height * 0.2291667,
        size.width * 0.5416897,
        size.height * 0.3037500,
        size.width * 0.5416897,
        size.height * 0.3958333);
    path_0.close();
    path_0.moveTo(size.width * 0.4583552, size.height * 0.3958333);
    path_0.cubicTo(
        size.width * 0.4583552,
        size.height * 0.3500000,
        size.width * 0.4208552,
        size.height * 0.3125000,
        size.width * 0.3750241,
        size.height * 0.3125000);
    path_0.cubicTo(
        size.width * 0.3291890,
        size.height * 0.3125000,
        size.width * 0.2916890,
        size.height * 0.3500000,
        size.width * 0.2916890,
        size.height * 0.3958333);
    path_0.cubicTo(
        size.width * 0.2916890,
        size.height * 0.4416667,
        size.width * 0.3291890,
        size.height * 0.4791667,
        size.width * 0.3750241,
        size.height * 0.4791667);
    path_0.cubicTo(
        size.width * 0.4208552,
        size.height * 0.4791667,
        size.width * 0.4583552,
        size.height * 0.4416667,
        size.width * 0.4583552,
        size.height * 0.3958333);
    path_0.close();
    path_0.moveTo(size.width * 0.3750241, size.height * 0.6458333);
    path_0.cubicTo(
        size.width * 0.2637724,
        size.height * 0.6458333,
        size.width * 0.04168897,
        size.height * 0.7016667,
        size.width * 0.04168897,
        size.height * 0.8125000);
    path_0.lineTo(size.width * 0.04168897, size.height * 0.8958333);
    path_0.lineTo(size.width * 0.7083552, size.height * 0.8958333);
    path_0.lineTo(size.width * 0.7083552, size.height * 0.8125000);
    path_0.cubicTo(
        size.width * 0.7083552,
        size.height * 0.7016667,
        size.width * 0.4862724,
        size.height * 0.6458333,
        size.width * 0.3750241,
        size.height * 0.6458333);
    path_0.close();
    path_0.moveTo(size.width * 0.3750241, size.height * 0.7291667);
    path_0.cubicTo(
        size.width * 0.2629390,
        size.height * 0.7291667,
        size.width * 0.1341890,
        size.height * 0.7825000,
        size.width * 0.1250224,
        size.height * 0.8125000);
    path_0.lineTo(size.width * 0.6250241, size.height * 0.8125000);
    path_0.cubicTo(
        size.width * 0.6166897,
        size.height * 0.7829185,
        size.width * 0.4875241,
        size.height * 0.7291667,
        size.width * 0.3750241,
        size.height * 0.7291667);
    path_0.close();
    path_0.moveTo(size.width * 0.6283552, size.height * 0.3145833);
    path_0.cubicTo(
        size.width * 0.6633552,
        size.height * 0.3637500,
        size.width * 0.6633552,
        size.height * 0.4275000,
        size.width * 0.6283552,
        size.height * 0.4766667);
    path_0.lineTo(size.width * 0.6983552, size.height * 0.5470815);
    path_0.cubicTo(
        size.width * 0.7825207,
        size.height * 0.4629148,
        size.width * 0.7825207,
        size.height * 0.3358333,
        size.width * 0.6983552,
        size.height * 0.2441667);
    path_0.lineTo(size.width * 0.6283552, size.height * 0.3145833);
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
