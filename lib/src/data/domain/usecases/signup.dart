import 'package:dartz/dartz.dart';
import 'package:tabnews/src/data/domain/repositories/register_repository.dart';

import '../../infra/models/user_model.dart';
import '../entities/register_entity.dart';
import '../errors/errors.dart';
import '../errors/signup_errors.dart';

abstract class Signup {
  Future<Either<Failure, UserModel>> call(
    RegisterEntity registerEntity,
  );
}

class SignupImpl implements Signup {
  final SignupRepository repository;

  SignupImpl(this.repository);
  @override
  Future<Either<Failure, UserModel>> call(
    RegisterEntity registerEntity,
  ) async {
    if (!registerEntity.isValidEmail) {
      return Left(ErrorSignupEmail(message: 'E-mail inválido!'));
    } else if (!registerEntity.isValidPassword) {
      return Left(ErrorSignupEmail(message: 'Senha inválida!'));
    }

    return await repository.signup(
      email: registerEntity.email,
      password: registerEntity.password,
      username: registerEntity.username,
    );
  }
}
