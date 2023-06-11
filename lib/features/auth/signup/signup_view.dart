import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/features/auth/complete_profile/complete_profile_view.dart';
import 'package:fitnest_x/features/auth/login/login.dart';
import 'package:fitnest_x/widgets/button_app.dart';
import 'package:fitnest_x/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../widgets/text_filed_app.dart';

final crateAccountStyle = TextStyle(
    fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.black);
final typeHereStyle = TextStyle(fontSize: 16.sp, color: AppColors.black);
final alreadyHaveAccountStyle =
    TextStyle(fontSize: 14.sp, color: AppColors.black);
final acceptPrivacyPolicyStyle =
    TextStyle(fontSize: 10.sp, color: AppColors.greyM);
const divider = Expanded(
    child: Divider(
  color: AppColors.greyL,
  thickness: 1,
));

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);
  bool acceptPrivacyPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          left: 30.w,
          right: 30.w,
          top: 40.h,
        ),
        children: [
          Text(
            AppStrings.heyThere,
            textAlign: TextAlign.center,
            style: typeHereStyle,
          ),
          Text(
            AppStrings.createAnAccount,
            textAlign: TextAlign.center,
            style: crateAccountStyle,
          ),
          TextFiledApp(
            controller: TextEditingController(),
            prefixIcon: AppAssets.person,
            hintText: AppStrings.firstName,
          ),
          SizedBox(
            height: 14.h,
          ),
          TextFiledApp(
            controller: TextEditingController(),
            prefixIcon: AppAssets.person,
            hintText: AppStrings.lastName,
          ),
          SizedBox(
            height: 14.h,
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
          SizedBox(
            height: 14.h,
          ),
          TextFiledApp(
            obscureText: true,
            applyObscureText: true,
            controller: TextEditingController(),
            prefixIcon: AppAssets.lock,
            hintText: AppStrings.confirmPassword,
          ),
          StatefulBuilder(builder: (ctx, mySetState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: CheckboxListTile(
                  activeColor: AppColors.brand.last,
                  title: Text.rich(
                    TextSpan(children: [
                      const TextSpan(
                        text: AppStrings.acceptPrivacyPolicy,
                      ),
                      TextSpan(
                          text: AppStrings.privacyPolicy,
                          style: acceptPrivacyPolicyStyle.copyWith(
                              decoration: TextDecoration.underline)),
                      const TextSpan(
                        text: AppStrings.and,
                      ),
                      TextSpan(
                          text: AppStrings.termOfUse,
                          style: acceptPrivacyPolicyStyle.copyWith(
                              decoration: TextDecoration.underline))
                    ]),
                    style: acceptPrivacyPolicyStyle,
                    textAlign: TextAlign.left,
                  ),
                  side: const BorderSide(color: AppColors.greyM, width: .8),
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  contentPadding: EdgeInsets.zero,
                  value: acceptPrivacyPolicy,
                  onChanged: (value) =>
                      mySetState(() => acceptPrivacyPolicy = value!)),
            );
          }),
          SizedBox(
            height: 14.h,
          ),
          ButtonApp(
            text: AppStrings.register,
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: CompleteProfileView(),
                      type: PageTransitionType.scale,
                      alignment: Alignment.bottomCenter));
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
                        child: LoginView(),
                        type: PageTransitionType.fade,
                        alignment: Alignment.bottomCenter));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAnAccount,
                    style: alreadyHaveAccountStyle,
                  ),
                  GradientText(
                      text: AppStrings.login,
                      style: alreadyHaveAccountStyle,
                      gradient: LinearGradient(colors: AppColors.secondary))
                ],
              ))
        ],
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
