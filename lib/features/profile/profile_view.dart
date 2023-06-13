import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:fitnest_x/widgets/gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/app_strings.dart';
import '../../widgets/appbar/appbar_app.dart';
import '../../widgets/switch/switch_app.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 40.sp),
      child: Column(
        children: [
          AppBarApp(title: AppStrings.profile),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.sp, horizontal: 30.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      gradient: LinearGradient(colors: AppColors.brand)),
                  child: Text(
                    AppStrings.edit,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: AppColors.white),
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: AppColors.blueL,
                  radius: 26.sp,
                  child: ClipOval(
                      child: SvgPicture.asset(
                    AppAssets.activityPerson2,
                    fit: BoxFit.fill,
                  )),
                ),
                title: Text(
                  'Ahmad Alhariri',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 6.sp),
                  child: Text(
                    'Flutter Devloper',
                    style: TextStyle(fontSize: 12.sp, color: AppColors.greyD),
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(.1),
                              blurRadius: 4.sp,
                              offset: Offset(0, 4.sp))
                        ]),
                    child: Column(
                      children: [
                        GradientText(
                          text: '180cm',
                          gradient: LinearGradient(colors: AppColors.brand),
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Height',
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColors.black),
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 20.sp,
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(.1),
                              blurRadius: 4.sp,
                              offset: Offset(0, 4.sp))
                        ]),
                    child: Column(
                      children: [
                        GradientText(
                          text: '65kg',
                          gradient: LinearGradient(colors: AppColors.brand),
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Weight',
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColors.black),
                        )
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 20.sp,
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(.1),
                              blurRadius: 4.sp,
                              offset: Offset(0, 4.sp))
                        ]),
                    child: Column(
                      children: [
                        GradientText(
                          text: '22yo',
                          gradient: LinearGradient(colors: AppColors.brand),
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Age',
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColors.black),
                        )
                      ],
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(.1),
                      blurRadius: 4.sp,
                      offset: Offset(0, 4.sp),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.account,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: SvgPicture.asset(AppAssets.profileIcon),
                      title: Text(
                        AppStrings.profile,
                        style:
                            TextStyle(color: AppColors.greyD, fontSize: 12.sp),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: SvgPicture.asset(AppAssets.achievement),
                      title: Text(
                        AppStrings.achievement,
                        style:
                            TextStyle(color: AppColors.greyD, fontSize: 12.sp),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: SvgPicture.asset(AppAssets.activity),
                      title: Text(
                        AppStrings.activityHistory,
                        style:
                            TextStyle(color: AppColors.greyD, fontSize: 12.sp),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: SvgPicture.asset(AppAssets.workout),
                      title: Text(
                        AppStrings.workoutProgress,
                        style:
                            TextStyle(color: AppColors.greyD, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(.1),
                      blurRadius: 4.sp,
                      offset: Offset(0, 4.sp),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.notification,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {},
                            leading:
                                SvgPicture.asset(AppAssets.notificationProfile),
                            title: Text(
                              AppStrings.popUpNotification,
                              style: TextStyle(
                                  color: AppColors.greyD, fontSize: 12.sp),
                            ),
                          ),
                        ),
                        AnimatedSwitch()
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(.1),
                      blurRadius: 4.sp,
                      offset: Offset(0, 4.sp),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.other,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: SvgPicture.asset(AppAssets.message),
                      title: Text(
                        AppStrings.contactUs,
                        style:
                            TextStyle(color: AppColors.greyD, fontSize: 12.sp),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: SvgPicture.asset(AppAssets.shieldDone),
                      title: Text(
                        AppStrings.privacyPolicy,
                        style:
                            TextStyle(color: AppColors.greyD, fontSize: 12.sp),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: SvgPicture.asset(AppAssets.setting),
                      title: Text(
                        AppStrings.settings,
                        style:
                            TextStyle(color: AppColors.greyD, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
