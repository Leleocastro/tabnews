import 'package:string_validator/string_validator.dart' as validator;

class RegisterEntity {
  final String email;
  final String password;
  final String username;

  RegisterEntity._({
    required this.email,
    required this.password,
    required this.username,
  });

  bool get isValidEmail => validator.isEmail(email);
  bool get isValidPassword => password.isNotEmpty && password.length >= 8;
  bool get isValidUserName => username.isNotEmpty && username.length > 3;

  factory RegisterEntity.withEmail({
    required String email,
    required String password,
    required String username,
  }) {
    return RegisterEntity._(
      email: email,
      password: password,
      username: username,
    );
  }
}
