import 'package:flutter_new_template/app/nav/controllers/nav_controller.dart';
import 'package:flutter_new_template/app/nav/favorites/controllers/favorites_controller.dart';
import 'package:flutter_new_template/app/nav/posts/controllers/posts_controller.dart';
import 'package:flutter_new_template/app_settings_controller.dart';

import 'package:get/get.dart';

class AppBinding implements Bindings {
  //Normally, Get.lazyPut loads dependencies only one time, which means that if the route gets removed, and created again, Get.lazyPut will not load them again. This default behavior might be preferable in some cases while for others, we have the fenix property.
  @override
  void dependencies() {
    Get.put(AppSettingsController(), permanent: true);
    Get.lazyPut<NavController>(() => NavController(), fenix: true);
    Get.lazyPut<PostsController>(() => PostsController(), fenix: true);
    Get.lazyPut<FavoritesController>(() => FavoritesController(), fenix: true);
  }
}
