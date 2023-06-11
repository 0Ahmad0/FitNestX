import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/features/auth/signup/signup_view.dart';
import 'package:fitnest_x/widgets/button_app.dart';
import 'package:fitnest_x/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../widgets/text_filed_app.dart';
import 'sucess_login_view.dart';

final welcomeBackStyle = TextStyle(
    fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.black);
final typeHereStyle = TextStyle(fontSize: 16.sp, color: AppColors.black);
final forgetPasswordStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.greyL,
    decoration: TextDecoration.underline);
final doNotHaveAnAccountYetStyle =
    TextStyle(fontSize: 14.sp, color: AppColors.black);
final acceptPrivacyPolicyStyle =
    TextStyle(fontSize: 10.sp, color: AppColors.greyM);
const divider = Expanded(
    child: Divider(
  color: AppColors.greyL,
  thickness: 1,
));

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  bool acceptPrivacyPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 40.h,
        ),
        child: Column(
          children: [
            Text(
              AppStrings.heyThere,
              textAlign: TextAlign.center,
              style: typeHereStyle,
            ),
            Text(
              AppStrings.welcomeBack,
              textAlign: TextAlign.center,
              style: welcomeBackStyle,
            ),
            TextFiledApp(
              controller: TextEditingController(),
              prefixIcon: AppAssets.email,
              hintText: AppStrings.email,
            ),
            SizedBox(
              height: 14.h,
            ),
            TextFiledApp(
              obscureText: true,
              applyObscureText: true,
              controller: TextEditingController(),
              prefixIcon: AppAssets.lock,
              hintText: AppStrings.password,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.forgetPassword,
                  style: forgetPasswordStyle,
                )),
            const Spacer(),
            ButtonApp(
              text: AppStrings.login,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: SuccessLoginView(),
                      type: PageTransitionType.leftToRightWithFade,
                      alignment: Alignment.topCenter),
                );
              },
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              children: [
                divider,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    AppStrings.or,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ),
                divider,
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                socialContainer(image: AppAssets.google, onTap: () {}),
                SizedBox(
                  width: 30.w,
                ),
                socialContainer(image: AppAssets.facebook, onTap: () {}),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                        child: SignupView(),
                        type: PageTransitionType.fade,
                        alignment: Alignment.topCenter),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.doNotHaveAnAccountYet,
                      style: doNotHaveAnAccountYetStyle,
                    ),
                    GradientText(
                        text: AppStrings.register,
                        style: doNotHaveAnAccountYetStyle,
                        gradient: LinearGradient(colors: AppColors.secondary))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget socialContainer({required String image, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50.sp,
        height: 50.sp,
        padding: EdgeInsets.all(14.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.greyL),
        ),
        child: SvgPicture.asset(image),
      ),
    );
  }
}
