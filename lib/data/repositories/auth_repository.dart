import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../domain/domain.dart';
import '../data_source/data_source.dart';
import '../models/models.dart';

class AuthRepositoryImp implements AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final MemoryDataSource _memoryDataSource;

  AuthRepositoryImp({
    required RemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
    required MemoryDataSource memoryDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _memoryDataSource = memoryDataSource;

  @override
  Future<Either<ExceptionApp, ResponseEntity>> login(LoginEntity loginEntity) async {
    try {
      final loginModel = LoginModel.fromEntity(loginEntity);
      final response = await _remoteDataSource.login(loginModel);
      return right(response.toEntity());
    } on ExceptionApp catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<ExceptionApp, UserEntity>> getUser() async {
    final authModel = _localDataSource.getAuthData();
    log('acceess ${authModel?.access}');
    log('refresh ${authModel?.access}');
    try {
      final response = await _remoteDataSource.getUser(authModel!.access);
      return right(response.toEntity());
    } on ExceptionApp catch (e) {
      return left(e);
    }
  }

  @override
  Future<void> updateAccessToken() async {
    try {
      final authModel = _localDataSource.getAuthData();
      final response = await _remoteDataSource.getAccessToken(authModel!.refresh);
      final newAuthEntity = AuthModel.fromJson(response.body!).toEntity();
      await saveAuthData(newAuthEntity);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveAuthData(AuthEntity authEntity) async {
    final authModel = AuthModel(
      access: authEntity.access,
      refresh: authEntity.refresh,
      expireIn: authEntity.expireIn,
    );
    await _localDataSource.saveAuthData(authModel);
  }

  @override
  UserEntity userEntityFromMap(Map<String, dynamic> map) =>
      UserModel.fromJson(map).toEntity();

  @override
  UserEntity? getSessionUser() => _memoryDataSource.getSessionUser()?.toEntity();

  @override
  void putSessionUser(UserEntity user) =>
      _memoryDataSource.putSessionUser(UserModel.fromEntity(user));
}
