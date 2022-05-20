import 'package:get/get.dart';
import 'package:tabnews/src/pages/home/home_controller.dart';
import 'package:tabnews/src/pages/login/login_page.dart';
import 'package:tabnews/src/pages/login/signup_page.dart';

import '../pages/home/home_page.dart';
import '../pages/login/login_controller.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut<HomeController>(
            () => HomeController(),
          );
        },
      ),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut<LoginController>(
            () => LoginController(),
          );
        },
      ),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupPage(),
    ),
  ];
}
