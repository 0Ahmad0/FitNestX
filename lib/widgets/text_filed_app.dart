import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/utils/app_assets.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_strings.dart';

class TextFiledApp extends StatelessWidget {
  TextFiledApp(
      {Key? key,
      required this.controller,
      required this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.obscureText = false,
      this.applyObscureText = false,
      this.readOnly = false,
      this.onTap})
      : super(key: key);
  final TextEditingController controller;
  final String prefixIcon;
  String? suffixIcon;
  final String hintText;
  final bool applyObscureText;
  bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: readOnly ? onTap : null,
      readOnly: readOnly,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.greyM),
        suffixIcon: applyObscureText
            ? StatefulBuilder(builder: (context, setState) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: SvgPicture.asset(
                      obscureText ? AppAssets.show : AppAssets.hide,
                      color: AppColors.greyD,
                    ),
                  ),
                );
              })
            : null,
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.sp),
          child: SvgPicture.asset(
            prefixIcon,
            color: AppColors.greyD,
          ),
        ),
        filled: true,
        fillColor: AppColors.border,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide.none),
      ),
    );
  }
}
