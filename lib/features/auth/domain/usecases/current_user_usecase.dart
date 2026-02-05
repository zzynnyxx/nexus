// features/auth/domain/usecases/current_user_usecase.dart
import 'package:fpdart/fpdart.dart' show Either;
import 'package:nexus_social/core/error/failures.dart';
import 'package:nexus_social/core/usecase/usecase.dart';
import 'package:nexus_social/features/auth/domain/entities/user_entity.dart';
import 'package:nexus_social/features/auth/domain/repositories/auth_repository.dart';

class CurrentUser implements UseCase<UserEntity, Noparams>{
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);

  @override
 Future<Either<Failure, UserEntity>> call(Noparams params) async{
  return await authRepository.currentUser();
 }
}