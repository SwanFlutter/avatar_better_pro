import 'dart:math';

import 'package:flutter/material.dart';

class GradientCirclePainter extends CustomPainter {
  final Gradient? gradientColors;
  final double withBorder;

  GradientCirclePainter({this.gradientColors, required this.withBorder});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    // Fix: Use the correct radius calculation to account for the border width
    final radius = size.width / 2 - withBorder / 2;
    const startAngle = 0;
    const sweepAngle = 2 * pi;

    final List<Color> colors =
        gradientColors?.colors ?? [Colors.blue, Colors.green];

    final gradient = SweepGradient(
      transform: GradientRotation(startAngle.toDouble()),
      startAngle: startAngle.toDouble(),
      endAngle: startAngle + sweepAngle,
      colors: colors,
    );

    final rect = Rect.fromCircle(center: center, radius: radius);

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = withBorder
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
