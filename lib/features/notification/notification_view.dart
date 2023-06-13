import 'package:animate_do/animate_do.dart';
import 'package:fitnest_x/core/utils/app_assets.dart';
import 'package:fitnest_x/core/utils/app_colors.dart';
import 'package:fitnest_x/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/appbar/appbar_app.dart';

final List<NotificationItem> notificationList = [
  NotificationItem(
      image: AppAssets.n1,
      title: 'Hey, it’s time for lunch',
      subTitle: 'About 1 minutes ago'),
  NotificationItem(
      image: AppAssets.n2,
      title: 'Don’t miss your lowerbody workout',
      subTitle: 'About 3 hours ago'),
  NotificationItem(
      image: AppAssets.n3,
      title: 'Hey, let’s add some meals for your b..',
      subTitle: 'About 3 hours ago'),
  NotificationItem(
      image: AppAssets.n2,
      title: 'Congratulations, You have finished A..',
      subTitle: '29 May'),
  NotificationItem(
      image: AppAssets.n4,
      title: 'Hey, it’s time for lunch',
      subTitle: '8 April'),
  NotificationItem(
      image: AppAssets.n5,
      title: 'Ups, You have missed your Lowerbo...',
      subTitle: '3 April'),
];

class NotificationItem {
  final String image;
  final String title;
  final String subTitle;

  NotificationItem({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.sp, horizontal: 30.sp),
        child: Column(
          children: [
            AppBarApp(
              title: AppStrings.notification,
            ),
            Expanded(
                child: ListView.separated(
              itemCount: notificationList.length,
              itemBuilder: (_, index) {
                final notificationItem = notificationList[index];
                return ElasticIn(
                  child: ListTile(
                    onTap: () {},
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: AppColors.secondary.last.withOpacity(.2),
                      radius: 25.sp,
                      child: SvgPicture.asset(notificationItem.image),
                    ),
                    title: Text(
                      notificationItem.title,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                    subtitle: Text(
                      notificationItem.subTitle,
                      style: TextStyle(fontSize: 10.sp, color: AppColors.greyD),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.greyM,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => const Divider(
                thickness: 1,
                color: AppColors.greyL,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
