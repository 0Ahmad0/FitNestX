import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';
import '../../widgets/button_app.dart';
import '../onboarding/onboarding_view.dart';

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
            ButtonApp(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.size,
                    alignment: Alignment.center,
                    child: OnBoardingView(),
                    isIos: true,
                  ),
                );
              },
              isGetStarted: true,
              text: AppStrings.getStarted,
            )
          ],
        ),
      ),
    );
  }
}
