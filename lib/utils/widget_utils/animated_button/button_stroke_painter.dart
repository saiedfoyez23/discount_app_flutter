import 'package:flutter/material.dart';
import 'dart:math' as math;

class ButtonStrokePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 1.0;
    const gapAngle = math.pi / 4.5;

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    /// ✅ Perfect center
    final center = Offset(size.width / 2, size.height / 2);

    /// ✅ Perfect radius (NO distortion)
    final radius = (size.shortestSide / 2) - (strokeWidth / 2);

    /// Gap centered exactly at LEFT (π)
    final startAngle = math.pi + (gapAngle / 2);
    final sweepAngle = (2 * math.pi) - gapAngle;

    final circleRect = Rect.fromCircle(
      center: center,
      radius: radius,
    );

    canvas.drawArc(
      circleRect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}