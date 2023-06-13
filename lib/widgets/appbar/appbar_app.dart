import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';

class AppBarApp extends StatelessWidget {
  const AppBarApp({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: InkWell(
        onTap: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        child: Container(
          alignment: Alignment.center,
          width: 32.sp,
          height: 32.sp,
          decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(.25),
                  blurRadius: 4.sp,
                  offset: Offset(0, 4.sp),
                )
              ]),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.black,
          ),
        ),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
          color: AppColors.black,
        ),
      ),
      trailing: Container(
        alignment: Alignment.center,
        width: 32.sp,
        height: 32.sp,
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(
          Icons.more_horiz,
          color: AppColors.black,
        ),
      ),
    );
  }
}
