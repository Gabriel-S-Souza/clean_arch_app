import 'dart:developer';

import 'package:hive_flutter/adapters.dart';

import '../models/auth_model.dart';
import 'contracts/contracts.dart';

class LocalDataSourceImp implements LocalDataSource {
  LocalDataSourceImp();

  late final Box authBox;

  Future<void> initialize() async {
    await Hive.initFlutter();
    authBox = await Hive.openBox<String>('authData');
  }

  @override
  Future<void> saveAuthData(AuthModel authModel) async {
    await authBox.put('access', authModel.access);
    await authBox.put('refresh', authModel.refresh);
    await authBox.put('expireIn', authModel.expireIn ?? '');
    log('Salvando dados no local');
    log('access: ${authBox.get('access')}');
    log('refresh: ${authBox.get('refresh')}');
    log('expireIn: ${authBox.get('expireIn')}');
  }

  @override
  AuthModel? getAuthData() {
    if (authBox.get('access') != null && authBox.get('access')!.isNotEmpty) {
      return AuthModel(
        access: authBox.get('access')!,
        refresh: authBox.get('refresh')!,
        expireIn: authBox.get('expireIn')!,
      );
    }
    return null;
  }

  @override
  bool get isLogged =>
      authBox.get('access') != null &&
      authBox.get('access')!.isNotEmpty &&
      authBox.get('refresh') != null &&
      authBox.get('refresh')!.isNotEmpty;
}
