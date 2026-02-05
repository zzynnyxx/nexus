// features/auth/domain/repositories/auth_repository.dart

import 'package:fpdart/fpdart.dart';
import 'package:nexus_social/core/error/failures.dart';
import 'package:nexus_social/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  // 1.Current User
  // Used when the apps start is someone logged in
  Future<Either<Failure,UserEntity>>currentUser();

  // 2. Login
  // Requires emials amd password.
  Future<Either<Failure,UserEntity>>loginWithEmailPassword({
    required String email,
    required String password,
  });

  // 3.SignUp
  // Requires emails,password and name
  Future<Either<Failure, UserEntity>>signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  // 4.Logout
  // returns void  (Unit) on success, failure if something breaks.
  Future<Either<Failure,Unit>>logout();
  
}