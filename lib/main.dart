import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_bindings.dart';
import 'constants.dart';
import 'utils/langs/my_translation.dart';
import 'package:requests_inspector/requests_inspector.dart';

Future<void> main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: kPrimaryColor // status bar color
          ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(RequestsInspector(child: MyApp(), enabled: kDebugMode));
  });
}

class MyApp extends StatelessWidget {
  final bool language = GetStorage().read('language') ?? true;
  final bool isDark = GetStorage().read('dark') ?? false;
  @override
  Widget build(BuildContext context) {
    logger.i(GetStorage().read('token'));
    return ScreenUtilInit(
        designSize: Size(375, 867),
        minTextAdapt: true,
        rebuildFactor: RebuildFactors.all,
        builder: (BuildContext context, Widget? child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              translations: MyTranslation(),
              theme: isDark ? darkTheme : lightTheme,
              locale: Locale('ar', 'EG'),
              initialBinding: AppBinding(),
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            ));
  }
}
