import 'package:flutter/cupertino.dart';

import '../../../export.dart';
import '../controllers/nav_controller.dart';

class NavView extends GetView<NavController> {
  const NavView({Key? key}) : super(key: key);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/meeting_active.png'),
        inactiveIcon: Image.asset('assets/images/meeting_ic.png'),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/notification_active.png'),
        inactiveIcon: Image.asset('assets/images/notification.png'),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/home_active.png'),
        inactiveIcon: Image.asset('assets/images/home_ina.png'),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/group_active.png'),
        inactiveIcon: Image.asset('assets/images/group.png'),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset('assets/images/profile_active.png'),
        inactiveIcon: Image.asset('assets/images/profile.png'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: PersistentTabView(
        context,
        controller: controller.pageController,
        screens: controller.widgetOptions,
        items: _navBarsItems(),
        backgroundColor: Colors.white, // Default is Colors.white.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        popAllScreensOnTapOfSelectedTab: true,
        navBarHeight: Get.height * .07,
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style8, // Choose the nav bar style with this property.
      ),
    );
  }
}
