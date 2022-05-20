import 'errors.dart';

class ErrorSignupEmail extends Failure {
  @override
  final String? message;
  ErrorSignupEmail({this.message});
}
