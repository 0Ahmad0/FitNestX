import 'package:animate_do/animate_do.dart';
import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:fitnest_x/core/utils/app_strings.dart';
import 'package:fitnest_x/widgets/appbar/appbar_app.dart';
import 'package:fitnest_x/widgets/gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/activity_chart/activity_chart.dart';

final List<LastActivity> lastActivityList = [
  LastActivity(
      image: AppAssets.activityPerson1,
      title: 'Drinking 300ml Water',
      subtitle: 'About 3 minutes ago'),
  LastActivity(
      image: AppAssets.activityPerson2,
      title: 'Eat Snack (Fitbar)',
      subtitle: 'About 10 minutes ago'),
  LastActivity(
      image: AppAssets.activityPerson2,
      title: 'Drinking 300ml Water',
      subtitle: 'About 3 minutes ago'),
  LastActivity(
      image: AppAssets.activityPerson1,
      title: 'Drinking 300ml Water',
      subtitle: 'About 6 minutes ago'),
];

class LastActivity {
  final String image;
  final String title;
  final String subtitle;

  LastActivity({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

class ActivityView extends StatelessWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 40.sp),
      child: Column(
        children: [
          AppBarApp(title: AppStrings.activityTracker),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                      color: AppColors.blueL,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.sp, vertical: 8.sp),
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
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.sp, vertical: 8.sp),
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
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
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
                ),
                SizedBox(
                  height: 30.sp,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    AppStrings.activityProgress,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        fontSize: 16.sp),
                  ),
                  trailing: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        gradient: LinearGradient(
                          colors: AppColors.brand,
                        )),
                    width: ScreenUtil.defaultSize.width / 3,
                    child: DropdownButtonFormField(
                      isDense: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.white,
                      ),
                      isExpanded: true,
                      alignment: AlignmentDirectional.center,
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Weekly',
                        hintStyle: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.white,
                        ),
                      ),
                      onChanged: (value) {},
                      items: [1, 2, 3, 4]
                          .map((e) => DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                child: Text(
                                  e.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppColors.black,
                                  ),
                                ),
                                value: e,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                AspectRatio(aspectRatio: 1.5, child: BarChartSample1()),
                SizedBox(
                  height: 30.sp,
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    AppStrings.latestActivity,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                        fontSize: 16.sp),
                  ),
                  trailing: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.showMore,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyM,
                          fontSize: 12.sp),
                    ),
                  ),
                ),
                for (int i = 0; i < lastActivityList.length; i++)
                  FadeIn(
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      margin: EdgeInsets.only(bottom: 20.sp),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.black.withOpacity(.1),
                                blurRadius: 4.sp,
                                offset: Offset(0, 4.sp))
                          ],
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.white),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 26.sp,
                          backgroundColor:
                              i.isEven ? AppColors.blueL : AppColors.pinkL,
                          child: ClipOval(
                              child: SvgPicture.asset(
                            lastActivityList[i].image,
                            fit: BoxFit.cover,
                          )),
                        ),
                        title: Text(
                          lastActivityList[i].title,
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ),
                        subtitle: Text(
                          lastActivityList[i].subtitle,
                          style: TextStyle(
                              fontSize: 10.sp, color: AppColors.greyM),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: AppColors.greyM,
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
