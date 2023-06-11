import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Introduction extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final double? imageWidth;
  final double? imageHeight;
  final TextStyle titleTextStyle;
  final TextStyle subTitleTextStyle;

  Introduction({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    this.titleTextStyle = const TextStyle(fontSize: 30),
    this.subTitleTextStyle = const TextStyle(fontSize: 20),
    this.imageWidth = 360,
    this.imageHeight = 360,
  });

  @override
  State<StatefulWidget> createState() {
    return new IntroductionState();
  }
}

class IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(
          widget.imageUrl,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 40.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            widget.title,
            overflow: TextOverflow.clip,
            style: widget.titleTextStyle,
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            widget.subTitle,
            style: widget.subTitleTextStyle,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}
