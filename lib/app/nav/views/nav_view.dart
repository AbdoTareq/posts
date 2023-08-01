import '../../../export.dart';
import '../controllers/nav_controller.dart';

class NavView extends GetView<NavController> {
  const NavView({Key? key}) : super(key: key);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, color: kPrimaryColor),
        inactiveIcon: Icon(Icons.home_outlined, color: kPrimaryColor),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite, color: kPrimaryColor),
        inactiveIcon: Icon(Icons.favorite_outline, color: kPrimaryColor),
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
        backgroundColor: Colors.grey.shade200, // Default is Colors.white.
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
        navBarStyle:
            NavBarStyle.style8, // Choose the nav bar style with this property.
      ),
    );
  }
}
