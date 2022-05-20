import 'package:dartz/dartz.dart';

import '../../infra/models/user_model.dart';
import '../errors/errors.dart';

abstract class SignupRepository {
  Future<Either<Failure, UserModel>> signup({
    required String email,
    required String password,
    required String username,
  });
}
