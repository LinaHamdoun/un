import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedCornerPainter extends CustomPainter {
  final Color color = Colors.white;
  final double strokeWidth = 4.0.w;
  final double cornerLength = 50.h;
  final double radius = 15.r;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(0, cornerLength), Offset(0, radius), paint);
    canvas.drawLine(Offset(radius, 0), Offset(cornerLength, 0), paint);
    canvas.drawArc(
      Rect.fromLTWH(0, 0, 2 * radius, 2 * radius),
      3.1416, // 180°
      1.5708, // 90°
      false,
      paint,
    );

    canvas.drawLine(
      Offset(size.width - cornerLength, 0),
      Offset(size.width - radius, 0),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, radius),
      Offset(size.width, cornerLength),
      paint,
    );
    canvas.drawArc(
      Rect.fromLTWH(size.width - 2 * radius, 0, 2 * radius, 2 * radius),
      -1.5708,
      1.5708,
      false,
      paint,
    );

    canvas.drawLine(
      Offset(0, size.height - cornerLength),
      Offset(0, size.height - radius),
      paint,
    );
    canvas.drawLine(
      Offset(radius, size.height),
      Offset(cornerLength, size.height),
      paint,
    );
    canvas.drawArc(
      Rect.fromLTWH(0, size.height - 2 * radius, 2 * radius, 2 * radius),
      1.5708,
      1.5708,
      false,
      paint,
    );

    canvas.drawLine(
      Offset(size.width - cornerLength, size.height),
      Offset(size.width - radius, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(size.width, size.height - radius),
      Offset(size.width, size.height - cornerLength),
      paint,
    );
    canvas.drawArc(
      Rect.fromLTWH(
        size.width - 2 * radius,
        size.height - 2 * radius,
        2 * radius,
        2 * radius,
      ),
      0,
      1.5708,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
