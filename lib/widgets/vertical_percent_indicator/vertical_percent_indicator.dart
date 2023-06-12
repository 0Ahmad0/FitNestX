import 'package:flutter/material.dart';

class VerticalPercentIndicator extends StatelessWidget {
  final double percent;
  final double lineHeight;
  final LinearGradient linearGradient;
  final BorderRadius borderRadius;
  final bool animation;
  final int animationDuration;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color progressColor;
  final Widget center;

  VerticalPercentIndicator({
    required this.percent,
    required this.lineHeight,
    required this.linearGradient,
    required this.borderRadius,
    this.animation = false,
    this.animationDuration = 300,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = Colors.transparent,
    this.progressColor = Colors.blue,
    required this.center,
  });

  @override
  Widget build(BuildContext context) {
    double currentPercent = percent;

    if (animation) {
      final controller = AnimationController(
        duration: Duration(milliseconds: animationDuration),
        vsync: Scaffold.of(context),
      );
      final curvedAnimation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      );
      final animation = Tween<double>(
        begin: 0,
        end: percent,
      ).animate(curvedAnimation);

      controller.forward();
      currentPercent = animation.value;
    }

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: progressColor,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: percent * lineHeight,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                gradient: linearGradient,
              ),
            ),
            center,
          ],
        ),
      ),
    );
  }
}
