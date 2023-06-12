import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:fitnest_x/features/activity/activity_view.dart';
import 'package:fitnest_x/features/camera/camera_view.dart';
import 'package:fitnest_x/features/home/home_view.dart';
import 'package:fitnest_x/features/profile/profile_view.dart';
import 'package:fitnest_x/features/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(_selectedIndex),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowNavBar.withOpacity(.1),
              blurRadius: 40.sp,
              offset: Offset(0, 10.sp),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavbarItem(
                index: 0,
                unActiveIcon: AppAssets.homeN,
                activeIcon: AppAssets.homeF),
            _buildNavbarItem(
                index: 1,
                unActiveIcon: AppAssets.activityN,
                activeIcon: AppAssets.activityF),
            SizedBox(
              width: 20.sp,
            ),
            _buildNavbarItem(
                index: 3,
                unActiveIcon: AppAssets.cameraN,
                activeIcon: AppAssets.cameraF),
            _buildNavbarItem(
                index: 4,
                unActiveIcon: AppAssets.profileN,
                activeIcon: AppAssets.profileF),
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return ActivityView();
      case 2:
        return SearchView();
      case 3:
        return CameraView();
      case 4:
        return ProfileView();
      default:
        return SizedBox.shrink();
    }
  }

  Widget _buildNavbarItem(
      {required int index,
      required String activeIcon,
      required String unActiveIcon}) {
    bool isSelected = index == _selectedIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });

        _playAnimation();
      },
      child: SizedBox(
        width: ScreenUtil().setWidth(60),
        height: ScreenUtil().setWidth(60),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  isSelected ? activeIcon : unActiveIcon,
                  width: 24.sp,
                  height: 24.sp,
                ),
              ),
            ),
            if (isSelected)
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Positioned(
                    bottom: 5.sp,
                    left:
                        (ScreenUtil().setWidth(60) - ScreenUtil().setWidth(8)) /
                            2, // Center the circle horizontally
                    child: Opacity(
                      opacity: _animation.value,
                      child: Container(
                        width: ScreenUtil().setWidth(6),
                        height: ScreenUtil().setWidth(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: AppColors.secondary,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: AppColors.brand),
          shape: BoxShape.circle),
      child: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        child: SvgPicture.asset(AppAssets.search),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  void _playAnimation() {
    _animationController.reset();
    _animationController.forward();
  }
}
