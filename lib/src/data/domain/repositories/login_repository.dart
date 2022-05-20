import 'package:dartz/dartz.dart';

import '../../infra/models/user_model.dart';
import '../errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });
}
