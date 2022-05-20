import 'package:dartz/dartz.dart';

import '../entities/login_entity.dart';
import '../errors/Login_errors.dart';
import '../repositories/login_repository.dart';
import '../../infra/models/user_model.dart';
import '../errors/errors.dart';

abstract class Login {
  Future<Either<Failure, UserModel>> call(
    LoginEntity loginEntity,
  );
}

class LoginImpl implements Login {
  final LoginRepository repository;

  LoginImpl(this.repository);
  @override
  Future<Either<Failure, UserModel>> call(
    LoginEntity loginEntity,
  ) async {
    if (!loginEntity.isValidEmail) {
      return Left(ErrorLogin(message: 'E-mail inválido!'));
    } else if (!loginEntity.isValidPassword) {
      return Left(ErrorLogin(message: 'Senha inválida!'));
    }

    return await repository.login(
      email: loginEntity.email,
      password: loginEntity.password,
    );
  }
}
