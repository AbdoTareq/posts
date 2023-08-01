import 'package:flutter_new_template/app/home/views/home_view.dart';

import '../../../export.dart';

class NavController extends GetxController {
  final RxInt _selectedIndex = 2.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  PersistentTabController pageController = PersistentTabController(initialIndex: 2);

  // if u want to navigate to any page use pageController
  final List<Widget> widgetOptions = <Widget>[
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
