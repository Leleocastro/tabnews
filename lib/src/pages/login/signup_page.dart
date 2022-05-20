import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tabnews/src/pages/login/signup_controller.dart';
import 'package:string_validator/string_validator.dart' as validator;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final controller = Get.find<SignupController>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("CADASTRO"),
        centerTitle: true,
      ),
      body: _body(w, h, context),
    );
  }

  Container _body(double w, double h, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      width: w,
      height: h,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: h / 8,
                  width: w / 3,
                  child: SvgPicture.asset(
                    'assets/images/favicon.svg',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Cadastro",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Necessário informar username!';
                  }
                  return null;
                },
                controller: controller.usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Necessário informar email!';
                  } else if (!validator.isEmail(value)) {
                    return 'Email inválido!';
                  }
                  return null;
                },
                controller: controller.emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Senha inválida!';
                  } else if (value.length < 8) {
                    return 'Senha deve ter no mínimo 8 caracteres!';
                  }
                  return null;
                },
                obscureText: true,
                controller: controller.passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Senha',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Confirmação de senha inválida!';
                  } else if (value != controller.passwordController.text) {
                    return 'Senhas não conferem!';
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Confirmar Senha',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Visibility(
                  visible: controller.errorMessage.value.isNotEmpty,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      controller.errorMessage.value,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(w / 1.1, h / 15)),
                  onPressed:
                      controller.isLoading.value ? null : controller.signup,
                  child: controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text("Cadastrar"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: RichText(
                  text: TextSpan(
                    text: "Possui uma conta?",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: " Login",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
