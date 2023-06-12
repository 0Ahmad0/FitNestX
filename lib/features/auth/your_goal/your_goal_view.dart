import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:fitnest_x/features/navbar/navbar_view.dart';
import 'package:fitnest_x/widgets/button_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/utils/app_strings.dart';

final whatIsYourGoalStyle = TextStyle(
    fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.black);
final helpUsChooseBestProgramStyle =
    TextStyle(fontSize: 12.sp, color: AppColors.greyD);

class YourGoalView extends StatelessWidget {
  const YourGoalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Text(
              AppStrings.whatIsYourGoal,
              textAlign: TextAlign.center,
              style: whatIsYourGoalStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Text(
              AppStrings.helpUsChooseBestProgram,
              textAlign: TextAlign.center,
              style: helpUsChooseBestProgramStyle,
            ),
          ),
          const Spacer(),
          CarouselSlider(
              items: goalItems
                  .map((e) => Builder(builder: (BuildContext context) {
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 30.sp),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: AppColors.brand,
                            ),
                            borderRadius: BorderRadius.circular(22.r),
                          ),
                          child: Column(
                            children: [
                              SvgPicture.asset(e.image),
                              const Spacer(),
                              Text(
                                e.title,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 8.sp),
                                width: 100.w,
                                height: 2.h,
                                decoration:
                                    BoxDecoration(color: AppColors.white),
                              ),
                              Text(
                                e.subTitle,
                                style: TextStyle(
                                    fontSize: 12.sp, color: AppColors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      }))
                  .toList(),
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  height: MediaQuery.of(context).size.height / 1.5)),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: ButtonApp(
                text: AppStrings.confirm,
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: NavBarView(),
                      type: PageTransitionType.topToBottom,
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 40.sp,
          ),
        ],
      ),
    );
  }
}

List<GoalItem> goalItems = [
  GoalItem(
      image: AppAssets.goal1,
      title: 'Improve Shape',
      subTitle:
          'I have a low amount of body fat and need / want to build more muscle'),
  GoalItem(
      image: AppAssets.goal2,
      title: 'Lean & Tone',
      subTitle:
          'I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way'),
  GoalItem(
      image: AppAssets.goal3,
      title: 'Lose a Fat',
      subTitle:
          'I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass'),
];

class GoalItem {
  final String image;
  final String title;
  final String subTitle;

  GoalItem({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}
