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
  Future<void> setupLocator() async {
    // http
    _getIt.registerFactory<HttpClient>(() => HttpClientImp());

    // datasources
    _getIt.registerFactory<RemoteDataSource>(
      () => RemoteDataSourceImp(httpClient: _getIt()),
    );

    final localDataSource = LocalDataSourceImp();
    await localDataSource.initialize();

    _getIt.registerSingleton<LocalDataSource>(localDataSource);

    _getIt.registerLazySingleton<MemoryDataSource>(
      () => MemoryDataSourceImp(),
    );

    // repository
    _getIt.registerFactory<LoginRepository>(
      () => LoginRepositoryImp(
          remoteDataSource: _getIt(),
          localDataSource: _getIt(),
          memoryDataSource: _getIt()),
    );

    // usecases
    _getIt.registerFactory<LoginUseCase>(
      () => LoginUseCaseImp(repository: _getIt()),
    );

    // controllers
    _getIt.registerLazySingleton<LoginController>(
      () => LoginController(loginUseCase: _getIt()),
    );

    _getIt.registerLazySingleton<HomeController>(
      () => HomeController(),
    );
  }

  @override
  T get<T extends Object>() => _getIt.get<T>();
}
