import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedSwitch extends StatefulWidget {
  const AnimatedSwitch({Key? key}) : super(key: key);

  @override
  _AnimatedSwitchState createState() => _AnimatedSwitchState();
}

class _AnimatedSwitchState extends State<AnimatedSwitch> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isActive = !_isActive;
        });
      },
      child: Container(
        width: 40.w,
        height: 20.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              _isActive ? AppColors.secondary.first : Colors.grey,
              _isActive ? AppColors.secondary.last : Colors.grey,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
              alignment:
                  _isActive ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(
                  left: !_isActive ? 3.sp : 0,
                  right: _isActive ? 3.sp : 0,
                ),
                width: 12.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
