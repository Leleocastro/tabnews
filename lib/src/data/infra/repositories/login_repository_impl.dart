import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/errors/signup_errors.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_datasource.dart';
import '../models/user_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await datasource.login(
        email: email,
        password: password,
      );
      return Right(result);
    } on ErrorSignupEmail catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ErrorSignupEmail(message: e.toString()));
    }
  }
}
