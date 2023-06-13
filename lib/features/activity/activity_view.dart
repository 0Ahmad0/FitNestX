import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:fitnest_x/core/utils/app_strings.dart';
import 'package:fitnest_x/widgets/appbar/appbar_app.dart';
import 'package:fitnest_x/widgets/gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 40.sp),
      children: [
        AppBarApp(title: AppStrings.activityTracker),
        Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
              color: AppColors.brand.first.withOpacity(.3),
              borderRadius: BorderRadius.circular(22.r),
              boxShadow: [
                BoxShadow(
                    color: AppColors.black.withOpacity(.25),
                    blurRadius: 4.sp,
                    offset: Offset(0, 4.sp))
              ]),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  AppStrings.todayTarget,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black),
                ),
                trailing: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 30.sp,
                    height: 30.sp,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: AppColors.brand),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.sp,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(.25),
                              blurRadius: 4.sp,
                              offset: Offset(0, 4.sp))
                        ]),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.activityGlass),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: GradientText(
                              text: '8 L',
                              gradient: LinearGradient(
                                colors: AppColors.brand,
                              ),
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(AppStrings.waterIntake),
                          ),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 12.sp,
                  ),
                  Expanded(
                      child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(.25),
                              blurRadius: 4.sp,
                              offset: Offset(0, 4.sp))
                        ]),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppAssets.activityBoots),
                        SizedBox(
                          width: 10.sp,
                        ),
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: GradientText(
                              text: '2400',
                              gradient: LinearGradient(
                                colors: AppColors.brand,
                              ),
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(AppStrings.footSteps),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
