// features/auth/domain/usecases/signup_usecase.dart
import 'package:fpdart/fpdart.dart';
import 'package:nexus_social/core/error/failures.dart';
import 'package:nexus_social/core/usecase/usecase.dart';
import 'package:nexus_social/features/auth/domain/entities/user_entity.dart';
import 'package:nexus_social/features/auth/domain/repositories/auth_repository.dart';

class UserSignUp implements UseCase<UserEntity, UserSignUpParams> {
  final AuthRepository authRepository;
  // Dependemcy Injection:
  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}


// We create a smaller class to hold the arguments
class UserSignUpParams{
final String email;
final String password;
final String name;

UserSignUpParams({
  required this.email,
  required this.password,
  required this.name,
});

}
