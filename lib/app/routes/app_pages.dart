import '../../export.dart';
import '../animated_splash/views/animated_splash_view.dart';
import '../home/bindings/home_binding.dart';
import '../home/views/home_view.dart';
import '../nav/bindings/nav_binding.dart';
import '../nav/views/nav_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AnimatedSplash;

  static final routes = [
    GetPage(
      name: _Paths.AnimatedSplash,
      page: () => AnimatedSplash(
        imagePath: 'assets/images/logo.png',
        home: (GetStorage().read('token') ?? '').toString().isNotEmpty
            ? Routes.NAV
            : Routes.LOGIN,
        duration: 1400,
        type: AnimatedSplashType.StaticDuration,
        title: '',
      ),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NAV,
      page: () => NavView(),
      binding: NavBinding(),
    ),
  ];
}
