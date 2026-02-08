// features/auth/presentation/bloc/auth_event.dart
import 'package:flutter/foundation.dart';

@immutable
sealed class AuthEvent{}

// 1.App Starts -> Check if user is logged in
final class AuthIsUserLoggedIn extends AuthEvent{}


// 2. User clicks Sign Up
final class AuthSignUp extends AuthEvent{
  final String email;
  final String password;
  final String name;


  AuthSignUp({
    required this.email,
    required this.password,
    required this.name,
  });
}

// 3.Use clicks Login
final class AuthLogin extends AuthEvent{
  final String email;
  final String password;


  AuthLogin({
    required this.email,
    required this.password,
  });
}

// 4.user clicks Logout
final class AuthLogout extends AuthEvent{}