import '../../../export.dart';
import '../controllers/nav_controller.dart';

class NavView extends GetView<NavController> {
  const NavView({Key? key}) : super(key: key);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.download),
        inactiveIcon: Icon(Icons.download_outlined),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        inactiveIcon: Icon(Icons.home_outlined),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        inactiveIcon: Icon(Icons.favorite_outline),
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
        navBarStyle:
            NavBarStyle.style8, // Choose the nav bar style with this property.
      ),
    );
  }
}
