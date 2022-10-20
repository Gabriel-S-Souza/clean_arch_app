import 'package:get_it/get_it.dart';

import '../app.dart';
import '../features/features.dart';

class ServiceLocatorImp implements ServiceLocator {
  ServiceLocatorImp._internal();
  static final I = ServiceLocatorImp._internal();

  final _getIt = GetIt.instance;

  @override
  void setupLocator() async {
    // http
    _getIt.registerFactory<HttpClient>(() => HttpClientImp());

    // datasource
    _getIt.registerFactory<LoginDataSource>(
      () => LoginDataSourceImp(httpClient: _getIt()),
    );

    // repository
    _getIt.registerFactory<LoginRepository>(
      () => LoginRepositoryImp(dataSource: _getIt()),
    );

    // usecase
    _getIt.registerFactory<LoginUseCase>(
      () => LoginUseCase(repository: _getIt()),
    );

    // controller
    _getIt.registerLazySingleton<LoginController>(
      () => LoginController(loginUseCase: _getIt()),
    );
  }

  @override
  T get<T extends Object>() => _getIt.get<T>();
}
