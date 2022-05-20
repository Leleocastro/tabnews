import 'package:string_validator/string_validator.dart' as validator;

class LoginEntity {
  final String email;
  final String password;

  LoginEntity._({
    required this.email,
    required this.password,
  });

  bool get isValidEmail => validator.isEmail(email);
  bool get isValidPassword => password.isNotEmpty && password.length >= 8;

  factory LoginEntity.withEmail({
    required String email,
    required String password,
  }) {
    return LoginEntity._(
      email: email,
      password: password,
    );
  }
}
