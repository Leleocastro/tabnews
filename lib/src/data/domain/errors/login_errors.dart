import 'package:tabnews/src/data/domain/errors/errors.dart';

class ConnectionError extends Failure {
  @override
  final String? message;
  ConnectionError({this.message});
}

class ErrorLogin extends Failure {
  @override
  final String? message;
  ErrorLogin({this.message});
}

class ErrorGetLoggedUser extends Failure {
  @override
  final String? message;
  ErrorGetLoggedUser({this.message});
}

class ErrorLogout extends Failure {
  @override
  final String? message;
  ErrorLogout({this.message});
}
