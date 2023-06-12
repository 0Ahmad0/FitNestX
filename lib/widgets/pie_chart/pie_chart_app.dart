import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedPieChart extends StatefulWidget {
  final List<PieSlice> slices;

  const AnimatedPieChart({super.key, required this.slices});

  @override
  _AnimatedPieChartState createState() => _AnimatedPieChartState();
}

class _AnimatedPieChartState extends State<AnimatedPieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: _PieChartPainter(
            slices: widget.slices,
            animationValue: _animation.value,
          ),
        );
      },
    );
  }
}

class _PieChartPainter extends CustomPainter {
  final List<PieSlice> slices;
  final double animationValue;

  _PieChartPainter({
    required this.slices,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startAngle = -pi / 2;
    double endAngle;

    for (var slice in slices) {
      endAngle = startAngle + (slice.percentage * 2 * pi * animationValue);
      _drawPieSlice(canvas, size, startAngle, endAngle, slice.gradientColors);
      startAngle = endAngle;
    }
  }

  void _drawPieSlice(
    Canvas canvas,
    Size size,
    double startAngle,
    double endAngle,
    List<Color> gradientColors,
  ) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final gradient = SweepGradient(
      startAngle: startAngle,
      endAngle: endAngle,
      colors: gradientColors,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    canvas.drawArc(rect, startAngle, endAngle - startAngle, true, paint);
  }

  @override
  bool shouldRepaint(_PieChartPainter oldDelegate) {
    return slices != oldDelegate.slices ||
        animationValue != oldDelegate.animationValue;
  }
}

class PieSlice {
  final double percentage;
  final List<Color> gradientColors;

  PieSlice({
    required this.percentage,
    required this.gradientColors,
  });
}
