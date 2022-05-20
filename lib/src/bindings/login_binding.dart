import 'package:get/get.dart';
import 'package:tabnews/src/data/domain/usecases/signup.dart';
import 'package:tabnews/src/data/infra/datasources/login_datasource.dart';
import 'package:tabnews/src/data/infra/repositories/signup_repository_impl.dart';

import '../data/domain/repositories/register_repository.dart';
import '../data/external/datasources/api_datasource.dart';
import '../pages/login/login_controller.dart';
import '../pages/login/signup_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    // DataSources
    LoginDatasource datasource = Get.put(ApiDatasource());

    // Repositories
    SignupRepository signupRepository =
        Get.put(SignupRepositoryImpl(datasource));

    // UseCases
    Signup signup = Get.put<Signup>(SignupImpl(signupRepository));

    // Controllers
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignupController>(() => SignupController(signup));
  }
}
