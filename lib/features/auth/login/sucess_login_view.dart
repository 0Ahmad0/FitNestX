import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:fitnest_x/core/utils/app_strings.dart';
import 'package:fitnest_x/widgets/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../widgets/bottom_navbar/bottom_navbar_app.dart';

final successLoginWelcomeStyle =
    TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold);
final successLoginStyle = TextStyle(fontSize: 12.sp, color: AppColors.greyD);

class SuccessLoginView extends StatelessWidget {
  const SuccessLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 40.sp),
          child: Column(
            children: [
              SvgPicture.asset(AppAssets.successLogin),
              SizedBox(
                height: 40.h,
              ),
              Text(AppStrings.successLoginWelcome + 'Ahmad',
                  style: successLoginWelcomeStyle),
              Text(
                AppStrings.successLogin,
                style: successLoginStyle,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ButtonApp(
                  text: AppStrings.goToHome,
                  onTap: () {
                    print('hello');
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: BottomNavbar(),
                        type: PageTransitionType.bottomToTop,
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
