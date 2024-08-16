import 'package:flutter/material.dart';

class BottomCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    for (double i = 0; i < 5; i++) {
      Paint shadowPaint = Paint()
        ..color = Colors.grey.withOpacity(0.025 )
        ..style = PaintingStyle.fill;

      Path shadowPath = Path();
      shadowPath.moveTo(0, 0);
      shadowPath.quadraticBezierTo(
          size.width / 2, -65 - (i * 2), size.width,0 ); 
      shadowPath.lineTo(size.width, size.height);
      shadowPath.lineTo(0, size.height);
      shadowPath.close();

      canvas.drawPath(shadowPath, shadowPaint);
    }

    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size.width / 2, -60, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
