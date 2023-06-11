import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../../widgets/gradient_text.dart';

const splashDecoration = BoxDecoration(
  gradient: LinearGradient(colors: AppColors.brand),
);

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 30.w),
        decoration: splashDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            SvgPicture.asset(AppAssets.logo),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99.r),
                  color: AppColors.white,
                ),
                child: GradientText(
                  gradient: LinearGradient(
                    colors: AppColors.brand,
                  ),
                  text: AppStrings.getStarted,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
