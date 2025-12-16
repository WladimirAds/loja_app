import 'package:get/get_navigation/get_navigation.dart';
import 'package:loja_app/src/pages/auth/sign_in_screen.dart';
import 'package:loja_app/src/pages/auth/sign_up_screen.dart';
import 'package:loja_app/src/pages/home/home_tab.dart';
import 'package:loja_app/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    // Define your app routes here
    GetPage(name: PagesRoutes.baseRoute, page: () => const HomeTab()),
    GetPage(name: PagesRoutes.splashRoute, page: () => const SplashScreen()),
    GetPage(name: PagesRoutes.signInRoute, page: () => SignInScreen()),
    GetPage(name: PagesRoutes.signUpRoute, page: () => SignUpScreen()),
  ];
}

abstract class PagesRoutes {
  static const String baseRoute = '/';
  static const String splashRoute = '/splash';
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
}
