import 'package:clean_arch/features/login/login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/login_response_fixture.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  final httpClient = HttpClientMock();
  final loginDataSource = LoginDataSourceImp(httpClient: httpClient);
  final responseModel = ResponseModel(
    statusCode: 200,
    body: loginResponseFixture,
  );
  final loginModel = getLoginModelFake();

  group('Login data source imp |', () {
    test('Should call HttpClient.post method 1 time', () async {
      // arrange
      when(() => httpClient.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => responseModel);

      // act
      await loginDataSource.login(loginModel);

      // assert
      verify(() => httpClient.post(any(), body: any(named: 'body'))).called(1);
    });

    test('Success: login method must return a UserModel', () async {
      // arrange
      when(() => httpClient.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => responseModel);

      // act
      final response = await loginDataSource.login(loginModel);

      // assert
      expect(response, isA<UserModel>());
    });

    test(
        'Exception: when HttpClient.post throws an Exception, the datasource must rethrow that Exception',
        () async {
      // arrange
      when(() => httpClient.post(any(), body: any(named: 'body')))
          .thenThrow(ConnectTimeoutException());

      // act & assert
      expect(
        () async => loginDataSource.login(loginModel),
        throwsA(isA<ConnectTimeoutException>()),
      );
    });
  });
}

LoginModel getLoginModelFake() => LoginModel(
      user: 'user',
      password: 'password',
    );
