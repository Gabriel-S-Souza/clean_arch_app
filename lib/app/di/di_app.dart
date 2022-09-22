import 'package:get_it/get_it.dart';

import '../features/features.dart';

class ServiceLocator {
  static void setUpDependencies() async {
    final getIt = GetIt.instance;

    final LoginController loginController = LoginController(
      loginUseCase: LoginUseCase(
        repository: LoginRepositoryImp(
          dataSource: LoginDataSourceImp(
            httpClient: HttpClientImp()
          )
        ) 
      )
    );

    getIt.registerSingleton<LoginController>(loginController);
  }
}

