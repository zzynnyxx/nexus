// features/auth/presentation/bloc/auth_state.dart
import 'package:flutter/foundation.dart';
import 'package:nexus_social/features/auth/domain/entities/user_entity.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

// 1.Initial state 
final class AuthInitial extends AuthState{}

// 2.Loading Spinner
final class AuthLoading extends AuthState{}

// 3.success
final class AuthSuccess extends AuthState {
  final UserEntity user;
  const AuthSuccess(this.user);
}

// 4.Failure(Error Message)
final class AuthFailure extends AuthState{
  final String message;
  const AuthFailure(this.message);
}