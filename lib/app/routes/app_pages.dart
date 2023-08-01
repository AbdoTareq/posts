import '../../export.dart';
import '../animated_splash/views/animated_splash_view.dart';
import '../home/bindings/home_binding.dart';
import '../home/views/home_view.dart';
import '../nav/bindings/nav_binding.dart';
import '../nav/download/bindings/download_binding.dart';
import '../nav/download/views/download_view.dart';
import '../nav/favorites/bindings/favorites_binding.dart';
import '../nav/favorites/views/favorites_view.dart';
import '../nav/post_details/bindings/post_details_binding.dart';
import '../nav/post_details/views/post_details_view.dart';
import '../nav/posts/bindings/posts_binding.dart';
import '../nav/posts/views/posts_view.dart';
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
      children: [
        GetPage(
          name: _Paths.POSTS,
          page: () => PostsView(),
          binding: PostsBinding(),
        ),
        GetPage(
          name: _Paths.DOWNLOAD,
          page: () => DownloadView(),
          binding: DownloadBinding(),
        ),
        GetPage(
          name: _Paths.FAVORITES,
          page: () => FavoritesView(),
          binding: FavoritesBinding(),
        ),
        GetPage(
          name: _Paths.POST_DETAILS,
          page: () => PostDetailsView(),
          binding: PostDetailsBinding(),
        ),
      ],
    ),
  ];
}
