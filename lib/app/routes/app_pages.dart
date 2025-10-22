import 'package:get/get.dart';
import 'package:krish/app/bindings/splash_binding.dart';
import 'package:krish/app/routes/app_routes.dart';
import 'package:krish/app/ui/splash/splash_screen.dart';


class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}
