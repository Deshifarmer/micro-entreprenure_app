import 'package:flutter/rendering.dart';

class PlayArrowShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7291688, size.height * 0.4999938);
    path_0.lineTo(size.width * 0.2708359, size.height * 0.7916625);
    path_0.lineTo(size.width * 0.2708359, size.height * 0.2083281);
    path_0.lineTo(size.width * 0.7291688, size.height * 0.4999938);
    path_0.close();
    path_0.moveTo(size.width * 0.5737531, size.height * 0.4999938);
    path_0.lineTo(size.width * 0.3541687, size.height * 0.3599938);
    path_0.lineTo(size.width * 0.3541687, size.height * 0.6399938);
    path_0.lineTo(size.width * 0.5737531, size.height * 0.4999938);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffFF9403).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
