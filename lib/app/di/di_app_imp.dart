import 'package:get_it/get_it.dart';

import '../app.dart';
import '../features/features.dart';

class ServiceLocatorImp implements ServiceLocator {
  ServiceLocatorImp._internal();
  static final I = ServiceLocatorImp._internal();

  final getIt = GetIt.instance;

  @override
  void setupLocator() async {
    // http
    getIt.registerFactory<HttpClient>(() => HttpClientImp());

    // datasource
    getIt.registerFactory<LoginDataSource>(
      () => LoginDataSourceImp(httpClient: getIt()),
    );

    // repository
    getIt.registerFactory<LoginRepository>(
      () => LoginRepositoryImp(dataSource: getIt()),
    );

    // usecase
    getIt.registerFactory<LoginUseCase>(
      () => LoginUseCase(repository: getIt()),
    );

    // controller
    getIt.registerLazySingleton<LoginController>(
      () => LoginController(loginUseCase: getIt()),
    );
  }

  @override
  T get<T extends Object>() => getIt.get<T>();
}
