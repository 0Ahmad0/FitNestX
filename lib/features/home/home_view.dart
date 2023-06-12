import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:fitnest_x/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

final nameStyle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20.sp, color: AppColors.black);
final welcomeStyle = TextStyle(fontSize: 12.sp, color: AppColors.greyM);

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 26.sp, vertical: 40.sp),
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            AppStrings.welcomeBack,
            style: welcomeStyle,
          ),
          subtitle: Text(
            'Ahmad Alhariri',
            style: nameStyle,
          ),
          trailing: Container(
            width: 50.sp,
            height: 50.sp,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.border),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: SvgPicture.asset(AppAssets.notification),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.sp),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.r),
            gradient: LinearGradient(colors: AppColors.brand),
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  AppStrings.bmi,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 4.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.haveNormalWeight,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.sp, vertical: 8.sp),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              gradient: LinearGradient(
                                colors: AppColors.secondary,
                              )),
                          child: Text(
                            AppStrings.viewMore,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: AppColors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
