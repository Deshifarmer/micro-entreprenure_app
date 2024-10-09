import 'package:deshifarmer/presentation/utils/deshi_colors.dart';
import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class TakaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path();
    path_0.moveTo(size.width * 0.6054800, size.height * 0.6458333);
    path_0.arcToPoint(Offset(size.width * 0.7654800, size.height * 0.6458333),
        radius: Radius.elliptical(
            size.width * 0.08000000, size.height * 0.08333333,),
        largeArc: true,);
    path_0.arcToPoint(Offset(size.width * 0.6054800, size.height * 0.6458333),
        radius: Radius.elliptical(
            size.width * 0.08000000, size.height * 0.08333333,),);
    path_0.close();

    final paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = primaryColor.withOpacity(1);
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    final path_1 = Path();
    path_1.moveTo(size.width * 0.3854800, size.height * 0.2500000);
    path_1.arcToPoint(Offset(size.width * 0.3454800, size.height * 0.2916667),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667,),
        clockwise: false,);
    path_1.arcToPoint(Offset(size.width * 0.2654800, size.height * 0.2916667),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667,),);
    path_1.arcToPoint(Offset(size.width * 0.3006000, size.height * 0.2032917),
        radius:
            Radius.elliptical(size.width * 0.1200000, size.height * 0.1250000),);
    path_1.moveTo(size.width * 0.3006000, size.height * 0.2032917);
    path_1.arcToPoint(Offset(size.width * 0.4703200, size.height * 0.2032917),
        radius:
            Radius.elliptical(size.width * 0.1200000, size.height * 0.1250000),);
    path_1.lineTo(size.width * 0.4420400, size.height * 0.2327500);
    path_1.lineTo(size.width * 0.4703200, size.height * 0.2032917);
    path_1.arcToPoint(Offset(size.width * 0.5054800, size.height * 0.2916667),
        radius:
            Radius.elliptical(size.width * 0.1200000, size.height * 0.1250000),);
    path_1.lineTo(size.width * 0.5054800, size.height * 0.6666667);
    path_1.arcToPoint(Offset(size.width * 0.6654800, size.height * 0.6666667),
        radius: Radius.elliptical(
            size.width * 0.08000000, size.height * 0.08333333,),
        clockwise: false,);
    path_1.lineTo(size.width * 0.6654800, size.height * 0.6458333);
    path_1.arcToPoint(Offset(size.width * 0.7454800, size.height * 0.6458333),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667,),
        largeArc: true,);
    path_1.lineTo(size.width * 0.7454800, size.height * 0.6666667);
    path_1.arcToPoint(Offset(size.width * 0.4254800, size.height * 0.6666667),
        radius:
            Radius.elliptical(size.width * 0.1600000, size.height * 0.1666667),);
    path_1.lineTo(size.width * 0.4254800, size.height * 0.2916667);
    path_1.arcToPoint(Offset(size.width * 0.3854800, size.height * 0.2500000),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667,),
        clockwise: false,);

    final paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = primaryColor.withOpacity(1);
    canvas.drawPath(path_1, paint1Fill);

    final path_2 = Path();
    path_2.moveTo(size.width * 0.3054800, size.height * 0.4583333);
    path_2.arcToPoint(Offset(size.width * 0.3454800, size.height * 0.4166667),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667,),);
    path_2.lineTo(size.width * 0.5854800, size.height * 0.4166667);
    path_2.arcToPoint(Offset(size.width * 0.5854800, size.height * 0.5000000),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667,),
        largeArc: true,);
    path_2.lineTo(size.width * 0.3454800, size.height * 0.5000000);
    path_2.arcToPoint(Offset(size.width * 0.3054800, size.height * 0.4583333),
        radius: Radius.elliptical(
            size.width * 0.04000000, size.height * 0.04166667,),);
    path_2.close();

    final paint2Fill = Paint()..style = PaintingStyle.fill;
    paint2Fill.color = primaryColor.withOpacity(1);
    canvas.drawPath(path_2, paint2Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
