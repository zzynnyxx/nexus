// features/auth/domain/usecases/login_usecase.dart
import 'package:fpdart/fpdart.dart';
import 'package:nexus_social/core/error/failures.dart';
import 'package:nexus_social/core/usecase/usecase.dart';
import 'package:nexus_social/features/auth/domain/entities/user_entity.dart';
import 'package:nexus_social/features/auth/domain/repositories/auth_repository.dart';

class UserLogin implements UseCase<UserEntity, UserLoginParams> {
  final AuthRepository authRepository;
  UserLogin(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(UserLoginParams params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}
