import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/utils/app_assets.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_strings.dart';

class TextFiledApp extends StatefulWidget {
  TextFiledApp(
      {Key? key,
      required this.controller,
      required this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.obscureText = false,
      this.applyObscureText = false})
      : super(key: key);
  final TextEditingController controller;
  final String prefixIcon;
  String? suffixIcon;
  final String hintText;
  final bool applyObscureText;
  bool obscureText;

  @override
  State<TextFiledApp> createState() => _TextFiledAppState();
}

class _TextFiledAppState extends State<TextFiledApp> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.greyM),
        suffixIcon: widget.applyObscureText
            ? InkWell(
                onTap: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: SvgPicture.asset(
                    widget.obscureText ? AppAssets.show : AppAssets.hide,
                    color: AppColors.greyD,
                  ),
                ),
              )
            : null,
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.sp),
          child: SvgPicture.asset(
            widget.prefixIcon,
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
