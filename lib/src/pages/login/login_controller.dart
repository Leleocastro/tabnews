import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  Rx<bool> isLoading = false.obs;

  Rx<String> errorMessage = ''.obs;

  void login() {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = '';
      Future.delayed(
        const Duration(seconds: 2),
        () {
          isLoading.value = false;
          Get.offAllNamed('/');
        },
      );
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }
}
