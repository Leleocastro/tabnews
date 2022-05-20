import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tabnews/src/data/infra/datasources/login_datasource.dart';
import 'package:tabnews/src/data/infra/models/user_model.dart';

import '../../domain/errors/signup_errors.dart';

class ApiDatasource implements LoginDatasource {
  @override
  Future<UserModel> signup({
    required String email,
    required String password,
    required String username,
  }) async {
    final dio = Get.find<Dio>();

    try {
      final response = await dio.post(
        '/users',
        data: {
          'email': email,
          'password': password,
          'username': username,
        },
      );

      return UserModel.fromMap(response.data);
    } on DioError catch (e) {
      throw ErrorSignupEmail(
          message:
              e.response?.data['message'].toString() ?? e.error.toString());
    } catch (e) {
      throw ErrorSignupEmail(message: e.toString());
    }
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final dio = Get.find<Dio>();

    try {
      final response = await dio.post(
        '/sessions',
        data: {
          'email': email,
          'password': password,
        },
      );

      return UserModel.fromMap(response.data);
    } on DioError catch (e) {
      throw ErrorSignupEmail(
          message:
              e.response?.data['message'].toString() ?? e.error.toString());
    } catch (e) {
      throw ErrorSignupEmail(message: e.toString());
    }
  }
}
