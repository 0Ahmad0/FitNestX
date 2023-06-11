import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../widgets/text_filed_app.dart';

final crateAccountStyle = TextStyle(
    fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.black);
final typeHereStyle = TextStyle(fontSize: 16.sp, color: AppColors.black);
final acceptPrivacyPolicyStyle =
    TextStyle(fontSize: 10.sp, color: AppColors.greyM);

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);
  bool acceptPrivacyPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
            vertical: 40.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                  child: ListView(
                children: [
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
                  SizedBox(
                    height: 14.h,
                  ),
                  StatefulBuilder(builder: (ctx, mySetState) {
                    return CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: acceptPrivacyPolicy,
                      onChanged: (value) {
                        mySetState(() => acceptPrivacyPolicy = value!);
                      },
                      title: Text(
                        AppStrings.acceptPrivacyPolicy,
                        style: acceptPrivacyPolicyStyle,
                      ),
                    );
                  })
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
