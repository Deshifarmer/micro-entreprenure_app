import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class TakaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6054800, size.height * 0.6458333);
    path_0.arcToPoint(Offset(size.width * 0.7654800, size.height * 0.6458333),
        radius: Radius.elliptical(
            size.width * 0.08000000, size.height * 0.08333333),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.6054800, size.height * 0.6458333),
        radius: Radius.elliptical(
            size.width * 0.08000000, size.height * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = primaryColor.withOpacity(1.0);
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.3854800, size.height * 0.2500000);
    path_1.arcToPoint(Offset(size.width * 0.3454800, size.height * 0.2916667),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.arcToPoint(Offset(size.width * 0.2654800, size.height * 0.2916667),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.arcToPoint(Offset(size.width * 0.3006000, size.height * 0.2032917),
        radius:
            Radius.elliptical(size.width * 0.1200000, size.height * 0.1250000),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.moveTo(size.width * 0.3006000, size.height * 0.2032917);
    path_1.arcToPoint(Offset(size.width * 0.4703200, size.height * 0.2032917),
        radius:
            Radius.elliptical(size.width * 0.1200000, size.height * 0.1250000),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.lineTo(size.width * 0.4420400, size.height * 0.2327500);
    path_1.lineTo(size.width * 0.4703200, size.height * 0.2032917);
    path_1.arcToPoint(Offset(size.width * 0.5054800, size.height * 0.2916667),
        radius:
            Radius.elliptical(size.width * 0.1200000, size.height * 0.1250000),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.lineTo(size.width * 0.5054800, size.height * 0.6666667);
    path_1.arcToPoint(Offset(size.width * 0.6654800, size.height * 0.6666667),
        radius: Radius.elliptical(
            size.width * 0.08000000, size.height * 0.08333333),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.lineTo(size.width * 0.6654800, size.height * 0.6458333);
    path_1.arcToPoint(Offset(size.width * 0.7454800, size.height * 0.6458333),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_1.lineTo(size.width * 0.7454800, size.height * 0.6666667);
    path_1.arcToPoint(Offset(size.width * 0.4254800, size.height * 0.6666667),
        radius:
            Radius.elliptical(size.width * 0.1600000, size.height * 0.1666667),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_1.lineTo(size.width * 0.4254800, size.height * 0.2916667);
    path_1.arcToPoint(Offset(size.width * 0.3854800, size.height * 0.2500000),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: false);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = primaryColor.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.3054800, size.height * 0.4583333);
    path_2.arcToPoint(Offset(size.width * 0.3454800, size.height * 0.4166667),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.lineTo(size.width * 0.5854800, size.height * 0.4166667);
    path_2.arcToPoint(Offset(size.width * 0.5854800, size.height * 0.5000000),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_2.lineTo(size.width * 0.3454800, size.height * 0.5000000);
    path_2.arcToPoint(Offset(size.width * 0.3054800, size.height * 0.4583333),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = primaryColor.withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
