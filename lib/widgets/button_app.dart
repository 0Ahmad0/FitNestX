import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_strings.dart';
import 'gradient_text.dart';

final textButtonStyle = TextStyle(
    fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.white);
const buttonGradient = LinearGradient(
  colors: AppColors.brand,
);

class ButtonApp extends StatelessWidget {
  const ButtonApp(
      {Key? key,
      required this.text,
      this.isGetStarted = false,
      required this.onTap})
      : super(key: key);
  final String text;
  final bool isGetStarted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99.r),
            color: isGetStarted ? AppColors.white : null,
            gradient: isGetStarted ? null : buttonGradient,
            boxShadow: isGetStarted
                ? null
                : [
                    BoxShadow(
                      color: AppColors.black.withOpacity(.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    )
                  ]),
        child: isGetStarted
            ? GradientText(
                gradient: buttonGradient,
                text: text,
                style: textButtonStyle,
              )
            : Text(
                text,
                style: textButtonStyle,
              ),
      ),
    );
  }
}
