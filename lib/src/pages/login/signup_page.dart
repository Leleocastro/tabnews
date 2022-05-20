import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("SIGN UP"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(17),
        width: w,
        height: h,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
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

                /// TOP TEXT
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                /// Email TextField
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Email TextField
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Password TextField
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                /// Confrim Password TextField
                TextField(
                  obscureText: true,
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirm Password',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// SIGN UP BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(w / 1.1, h / 15)),
                  onPressed: () {},
                  child: const Text("Sign Up"),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// LOGIN TEXT
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                      text: "Have an account?",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: " Login",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
