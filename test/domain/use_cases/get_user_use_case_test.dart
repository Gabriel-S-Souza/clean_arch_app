import 'package:clean_arch/domain/domain.dart';
import 'package:clean_arch/domain/use_cases/get_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MemoryRepositoryMock extends Mock implements MemoryRepository {}

class UserEntityFake extends Fake implements UserEntity {}

void main() {
  final memoryRepository = MemoryRepositoryMock();
  final getUserUseCase = GetUserUseCase(repository: memoryRepository);
  final userEntity = UserEntityFake();

  group('Get user use case |', () {
    test('MemoryRepository.getCurrentUser method must be called 1 time', () {
      // arrange
      when(() => memoryRepository.getCurrentUser()).thenReturn(userEntity);

      // act
      getUserUseCase();

      // assert
      verify(() => memoryRepository.getCurrentUser()).called(1);
    });

    test('Should return a UserEntity or null', () {
      // arrange
      when(() => memoryRepository.getCurrentUser()).thenReturn(userEntity);

      // act
      final response = getUserUseCase();

      // assert
      expect(response, isA<UserEntity>());
    });
  });
}
