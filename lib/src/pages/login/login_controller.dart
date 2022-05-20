import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tabnews/src/data/domain/entities/login_entity.dart';
import 'package:tabnews/src/data/domain/usecases/login.dart';

class LoginController {
  final Login loginUsecase;

  LoginController(this.loginUsecase);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  Rx<bool> isLoading = false.obs;

  Rx<String> errorMessage = ''.obs;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await loginUsecase(
        LoginEntity.withEmail(
          email: emailController.text,
          password: passwordController.text,
        ),
      );

      result.fold(
        (l) {
          isLoading.value = false;
          errorMessage.value = l.message!;
        },
        (r) {
          isLoading.value = false;
          print(r.id);
          Get.snackbar(
            'Boas Vindas',
            'Seja Bem-vindo, ${r.username}!',
            duration: const Duration(
              seconds: 3,
            ),
            backgroundColor: Colors.grey.shade300,
          );
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
