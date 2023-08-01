import '../../export.dart';
import '../animated_splash/views/animated_splash_view.dart';
import '../auth/change_pass/bindings/change_pass_binding.dart';
import '../auth/change_pass/views/change_pass_view.dart';
import '../auth/login/bindings/login_binding.dart';
import '../auth/login/views/login_view.dart';
import '../auth/reset_pass/bindings/reset_pass_binding.dart';
import '../auth/reset_pass/views/reset_pass_view.dart';
import '../auth/signup/bindings/signup_binding.dart';
import '../auth/signup/views/signup_view.dart';
import '../auth/verify_code/bindings/verify_code_binding.dart';
import '../auth/verify_code/views/verify_code_view.dart';
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
        home: (GetStorage().read('token') ?? '').toString().isNotEmpty ? Routes.NAV : Routes.LOGIN,
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
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASS,
      page: () => ChangePassView(),
      binding: ChangePassBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASS,
      page: () => ResetPassView(),
      binding: ResetPassBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_CODE,
      page: () => VerifyCodeView(),
      binding: VerifyCodeBinding(),
    ),
  ];
}
