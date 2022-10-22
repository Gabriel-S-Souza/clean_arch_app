import 'package:get_it/get_it.dart';

import '../data/data.dart';
import '../domain/domain.dart';
import '../presentation/presentation.dart';
import 'service_locator.dart';

class ServiceLocatorImp implements ServiceLocator {
  ServiceLocatorImp._internal();
  static final I = ServiceLocatorImp._internal();

  final _getIt = GetIt.instance;

  @override
  void setupLocator() async {
    // http
    _getIt.registerFactory<HttpClient>(() => HttpClientImp());

    // datasources
    _getIt.registerFactory<LoginDataSource>(
      () => LoginDataSourceImp(httpClient: _getIt()),
    );

    _getIt.registerLazySingleton<MemoryDataSource>(
      () => MemoryDataSourceImp(),
    );

    // repositories
    _getIt.registerFactory<LoginRepository>(
      () => LoginRepositoryImp(dataSource: _getIt()),
    );

    _getIt.registerFactory<MemoryRepository>(
      () => MemoryRepositoryImp(dataSource: _getIt()),
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
