import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/domain/entities/register_entity.dart';
import '../../data/domain/usecases/signup.dart';

class SignupController {
  final Signup signupUsecase;

  SignupController(this.signupUsecase);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  Rx<bool> isLoading = false.obs;

  Rx<String> errorMessage = ''.obs;

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = '';
      final result = await signupUsecase(
        RegisterEntity.withEmail(
          email: emailController.text,
          password: passwordController.text,
          username: usernameController.text,
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
            'Valide sua conta',
            '${r.username}, enviamos um link para o seu e-mail!',
            duration: const Duration(
              seconds: 5,
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
