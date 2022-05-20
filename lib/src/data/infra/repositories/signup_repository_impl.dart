import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/errors/signup_errors.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/login_datasource.dart';
import '../models/user_model.dart';

class SignupRepositoryImpl implements SignupRepository {
  final LoginDatasource datasource;

  SignupRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, UserModel>> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final result = await datasource.signup(
        email: email,
        password: password,
        username: username,
      );
      return Right(result);
    } on ErrorSignupEmail catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ErrorSignupEmail(message: e.toString()));
    }
  }
}
