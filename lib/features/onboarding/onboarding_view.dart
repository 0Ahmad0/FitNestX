import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/utils/app_assets.dart';
import '../../widgets/onboargong_app/inroduction.dart';
import '../../widgets/onboargong_app/onboarding_app.dart';
import '../auth/signup/signup_view.dart';

final titleStyle = TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold);
final subTitleStyle = TextStyle(fontSize: 14.sp, color: AppColors.greyD);
final introductionList = [
  Introduction(
    title: 'Track Your Goal',
    subTitle:
        'Don\'t worry if you have trouble determining your goals, We can help you determine your goals and track your goals',
    imageUrl: AppAssets.onBoarding1,
    titleTextStyle: titleStyle,
    subTitleTextStyle: subTitleStyle,
  ),
  Introduction(
    title: 'Get Burn',
    subTitle:
        'Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever',
    imageUrl: AppAssets.onBoarding2,
    titleTextStyle: titleStyle,
    subTitleTextStyle: subTitleStyle,
  ),
  Introduction(
    title: 'Eat Well',
    subTitle:
        'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun',
    imageUrl: AppAssets.onBoarding3,
    titleTextStyle: titleStyle,
    subTitleTextStyle: subTitleStyle,
  ),
  Introduction(
    title: 'Improve Sleep  Quality',
    subTitle:
        'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning',
    imageUrl: AppAssets.onBoarding4,
    titleTextStyle: titleStyle,
    subTitleTextStyle: subTitleStyle,
  ),
];

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreenOnboarding(
        introductionList: introductionList,
        onTapSkipButton: () {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTopJoined,
              alignment: Alignment.center,
              child: SignupView(),
              childCurrent: OnBoardingView(),
              isIos: true,
            ),
          );
        },
      ),
    );
  }
}
