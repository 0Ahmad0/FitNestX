import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:fitnest_x/core/utils/app_strings.dart';
import 'package:fitnest_x/features/auth/your_goal/your_goal_view.dart';
import 'package:fitnest_x/widgets/button_app.dart';
import 'package:fitnest_x/widgets/text_filed_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

final completeProfileStyle = TextStyle(
    fontSize: 20.sp, fontWeight: FontWeight.bold, color: AppColors.black);
final moreAboutYouStyle = TextStyle(fontSize: 12.sp, color: AppColors.greyD);
final yorDataDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(14.r),
  gradient: LinearGradient(colors: AppColors.secondary),
);

class CompleteProfileView extends StatelessWidget {
  DateTime? _selectedDate;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          left: 30.sp,
          right: 30.sp,
          bottom: 20.sp,
        ),
        children: [
          SvgPicture.asset(AppAssets.completeProfile),
          Text(
            AppStrings.completeProfile,
            style: completeProfileStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            AppStrings.moreAboutYou,
            style: moreAboutYouStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.h,
          ),
          DropdownButtonFormField(
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              decoration: InputDecoration(
                hintText: AppStrings.chooseGender,
                hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.greyM),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: SvgPicture.asset(
                    AppAssets.gender,
                    color: AppColors.greyD,
                  ),
                ),
                filled: true,
                fillColor: AppColors.border,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.r),
                    borderSide: BorderSide.none),
              ),
              items: ['Male', 'Female']
                  .map((e) => DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList(),
              onChanged: (value) {}),
          SizedBox(
            height: 14.h,
          ),
          TextFiledApp(
              onTap: () {
                _selectDate(context);
              },
              readOnly: true,
              controller: _textEditingController,
              prefixIcon: AppAssets.calender,
              hintText: AppStrings.dateOfBirth),
          SizedBox(
            height: 14.h,
          ),
          buildYourData(
              text: AppStrings.kg,
              hint: AppStrings.weight,
              icon: AppAssets.weight),
          SizedBox(
            height: 14.h,
          ),
          buildYourData(
              text: AppStrings.cm,
              hint: AppStrings.height,
              icon: AppAssets.height),
          SizedBox(
            height: 14.h,
          ),
          ButtonApp(
              text: AppStrings.next,
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        childCurrent: CompleteProfileView(),
                        child: YourGoalView(),
                        type: PageTransitionType.bottomToTopPop,
                        alignment: Alignment.bottomRight));
              })
        ],
      ),
    );
  }

  Row buildYourData(
      {required String text, required String icon, required String hint}) {
    return Row(
      children: [
        Expanded(
          child: TextFiledApp(
              controller: TextEditingController(),
              prefixIcon: icon,
              hintText: hint),
        ),
        SizedBox(
          width: 14.w,
        ),
        Container(
          alignment: Alignment.center,
          width: 50.sp,
          height: 50.sp,
          decoration: yorDataDecoration,
          child: Text(
            text,
            style: moreAboutYouStyle.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate!)
        ..selection = TextSelection.fromPosition(
          TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream,
          ),
        );
    }
  }
}
