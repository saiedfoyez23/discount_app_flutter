import 'package:flutter/material.dart';
import 'dart:math' as math;

class ButtonStrokePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 1.0;

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const gapAngle = math.pi / 4.5; // gap size
    final startAngle = math.pi + (gapAngle / 2);
    final sweepAngle = (2 * math.pi) - gapAngle;

    canvas.drawArc(
      Offset.zero & size,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}