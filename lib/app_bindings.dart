import 'package:flutter_new_template/app/home/controllers/home_controller.dart';
import 'package:flutter_new_template/app_settings_controller.dart';

import 'package:get/get.dart';

class AppBinding implements Bindings {
  //Normally, Get.lazyPut loads dependencies only one time, which means that if the route gets removed, and created again, Get.lazyPut will not load them again. This default behavior might be preferable in some cases while for others, we have the fenix property.
  @override
  void dependencies() {
    Get.put(AppSettingsController(), permanent: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
