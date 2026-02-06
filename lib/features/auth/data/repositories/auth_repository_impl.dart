// features/auth/data/repositories/auth_repository_impl.dart

import 'package:fpdart/fpdart.dart';
import 'package:nexus_social/core/error/exceptions.dart';
import 'package:nexus_social/core/error/failures.dart';
import 'package:nexus_social/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nexus_social/features/auth/domain/entities/user_entity.dart';
import 'package:nexus_social/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  //  1. Dependancy Injection
  //  We dont create Data source here we ask for it.
  AuthRepositoryImpl(this.remoteDataSource);

  // CURRENTUSER
  @override
  Future<Either<Failure, UserEntity>> currentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();

      if (user == null) {
        // if superbase says no use found we return a failure.
        // The Ui will se this and redirewct to the login page.
        return left(const ConnectionFailure('User is not logged in'));
      }

      return right(user);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  // LOGIN
  @override
  Future<Either<Failure, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  // SIGNIN
  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  // 2. THE WRAPPER FUNCTION (DRY PRINCIPLE)
  Future<Either<Failure, UserEntity>> _getUser(
    Future<UserEntity> Function() fn,
  ) async {
    try {
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  // LOGOUT
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remoteDataSource.logout();
      return right(unit);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
