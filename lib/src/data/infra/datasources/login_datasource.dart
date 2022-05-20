import '../models/user_model.dart';

abstract class LoginDatasource {
  Future<UserModel> signup({
    required String email,
    required String password,
    required String username,
  });
  Future<UserModel> login({
    required String email,
    required String password,
  });
}
