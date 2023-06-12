import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:fitnest_x/core/utils/app_strings.dart';
import 'package:fitnest_x/widgets/gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../widgets/pie_chart/pie_chart_app.dart';
import '../../widgets/pie_chart/pie_new.dart';
import '../../widgets/sleep_chart/sleep_chart.dart';
import '../../widgets/vertical_percent_indicator/vertical_percent_indicator.dart';

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
        BannerHomeBMI(),
        SizedBox(
          height: 30.sp,
        ),
        Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.sp,
              horizontal: 18.sp,
            ),
            decoration: BoxDecoration(
              color: AppColors.brand.last.withOpacity(.2),
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                    color: AppColors.black.withOpacity(.1),
                    blurRadius: 4.sp,
                    offset: Offset(0, 4.sp)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  AppStrings.todayTarget,
                  style: TextStyle(fontSize: 14.sp, color: AppColors.black),
                )),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      gradient: LinearGradient(colors: AppColors.brand),
                    ),
                    child: Text(
                      AppStrings.check,
                      style: TextStyle(fontSize: 12.sp, color: AppColors.white),
                    ),
                  ),
                )
              ],
            )),
        SizedBox(
          height: 30.sp,
        ),
        Text(
          AppStrings.activityStatus,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black),
        ),
        SizedBox(
          height: 30.sp,
        ),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: AppColors.brand.first,
              borderRadius: BorderRadius.circular(14.r)),
        ),
        SizedBox(
          height: 30.sp,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.black.withOpacity(.25),
                          blurRadius: 4.sp,
                          offset: Offset(0, 4.sp))
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 290,
                      child: VerticalPercentIndicator(
                        percent: 0.8,
                        lineHeight: 200.0,
                        linearGradient: LinearGradient(
                          colors: AppColors.brand,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        animation: true,
                        animationDuration: 1000,
                        progressColor: AppColors.border,
                        center: SizedBox(),
                      ),
                    ),
                    SizedBox(
                      width: 8.sp,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            AppStrings.waterIntake,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: AppColors.black),
                          ),
                          SizedBox(
                            height: 4.sp,
                          ),
                          GradientText(
                            text: '4 Liters',
                            gradient: LinearGradient(
                              colors: AppColors.brand,
                            ),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          Text(
                            AppStrings.realTimeUpdate,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: AppColors.greyD),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            ///
            SizedBox(
              width: 20.sp,
            ),

            ///
            Expanded(
                child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.sp),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.black.withOpacity(.25),
                            blurRadius: 4.sp,
                            offset: Offset(0, 4.sp))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppStrings.sleep,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: AppColors.black),
                      ),
                      SizedBox(
                        height: 4.sp,
                      ),
                      GradientText(
                        text: '8h 20m',
                        gradient: LinearGradient(
                          colors: AppColors.brand,
                        ),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4.sp,
                      ),
                      SizedBox(
                        height: 150,
                        width: 200,
                        child: LLineChart(
                          isShowingMainData: true,
                        ),
                      )
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
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.black.withOpacity(.25),
                            blurRadius: 4.sp,
                            offset: Offset(0, 4.sp))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppStrings.calories,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: AppColors.black),
                      ),
                      SizedBox(
                        height: 4.sp,
                      ),
                      GradientText(
                        text: '760 kCal',
                        gradient: LinearGradient(
                          colors: AppColors.brand,
                        ),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4.sp,
                      ),
                      CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        backgroundColor: AppColors.border,
                        linearGradient: LinearGradient(colors: AppColors.brand),
                        radius: 55.sp,
                        lineWidth: 10.sp,
                        percent: .7,
                        center: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(6.sp),
                          margin: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: AppColors.brand,
                              )),
                          child: Text(
                            '230kCal left',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ],
    );
  }
}

class BannerHomeBMI extends StatelessWidget {
  const BannerHomeBMI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        gradient: LinearGradient(colors: AppColors.brand),
        image: DecorationImage(
          image: AssetImage(AppAssets.homeBannerDots),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 10.sp,
                bottom: 10.sp,
                child: Container(
                  width: 80.sp,
                  height: 80.sp,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.shadowNavBar.withOpacity(.1),
                            blurRadius: 40.sp,
                            offset: Offset(0, 10.sp))
                      ]),
                ),
              ),
              SizedBox(
                height: 100.sp,
                width: 100.sp,
                child: AnimatedPieChart(
                  slices: [
                    PieSlice(
                      percentage: .31,
                      gradientColors: AppColors.secondary,
                    ),
                  ],
                ),
              ),
              // CircleAvatar(
              //   radius: 15.sp,
              //   backgroundColor: AppColors.black.withOpacity(.5),
              //   child: Center(
              //     child: Text(
              //       '20,1',
              //       style: TextStyle(
              //           fontSize: 12.sp,
              //           color: AppColors.white,
              //           fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
