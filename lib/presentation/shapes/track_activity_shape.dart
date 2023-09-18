import 'package:flutter/rendering.dart';

class TrackActivityShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.8629167, size.height * 0.1684196);
    path_0.cubicTo(
        size.width * 0.8791667,
        size.height * 0.1521713,
        size.width * 0.8791667,
        size.height * 0.1259238,
        size.width * 0.8629167,
        size.height * 0.1096754,);
    path_0.lineTo(size.width * 0.7654167, size.height * 0.01218563);
    path_0.cubicTo(size.width * 0.7576333, size.height * 0.004384250,
        size.width * 0.7470625, 0, size.width * 0.7360417, 0,);
    path_0.cubicTo(
        size.width * 0.7250208,
        0,
        size.width * 0.7144500,
        size.height * 0.004384250,
        size.width * 0.7066667,
        size.height * 0.01218563,);
    path_0.lineTo(size.width * 0.6250000, size.height * 0.09384375);
    path_0.lineTo(size.width * 0.7812500, size.height * 0.2500775);
    path_0.lineTo(size.width * 0.8629167, size.height * 0.1684196);
    path_0.close();
    path_0.moveTo(size.width * 0.1666667, size.height * 0.5521292);
    path_0.lineTo(size.width * 0.5833333, size.height * 0.1355062);
    path_0.lineTo(size.width * 0.7395833, size.height * 0.2917400);
    path_0.lineTo(size.width * 0.3229167, size.height * 0.7083625);
    path_0.lineTo(size.width * 0.1666667, size.height * 0.7083625);
    path_0.lineTo(size.width * 0.1666667, size.height * 0.5521292);
    path_0.close();
    path_0.moveTo(size.width * 0.2500000, size.height * 0.6250375);
    path_0.lineTo(size.width * 0.2883333, size.height * 0.6250375);
    path_0.lineTo(size.width * 0.6216667, size.height * 0.2917400);
    path_0.lineTo(size.width * 0.5833333, size.height * 0.2534108);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.5867083);
    path_0.lineTo(size.width * 0.2500000, size.height * 0.6250375);
    path_0.close();
    path_0.moveTo(size.width, size.height * 0.8333500);
    path_0.lineTo(0, size.height * 0.8333500);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.8333500);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffF2994A).withOpacity(1);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
