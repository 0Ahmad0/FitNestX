import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavBarView extends StatelessWidget {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: [
        Container(color: Colors.red),
        Container(color: Colors.yellow),
        Container(color: Colors.cyan),
        Container(color: Colors.deepOrange),
        Container(color: Colors.purple),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.ac_unit),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.ac_unit),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.ac_unit),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.ac_unit),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.ac_unit),
        )
      ],
      confineInSafeArea: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style13,
      navBarHeight: 200, // Choose the nav bar style with this property.
    );
  }
}
