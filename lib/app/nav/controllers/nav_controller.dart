import 'package:flutter_new_template/app/nav/favorites/views/favorites_view.dart';
import 'package:flutter_new_template/app/nav/posts/views/posts_view.dart';

import '../../../export.dart';

class NavController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;

  PersistentTabController pageController =
      PersistentTabController(initialIndex: 0);

  // if u want to navigate to any page use pageController
  final List<Widget> widgetOptions = <Widget>[
    PostsView(),
    FavoritesView(),
  ];

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
