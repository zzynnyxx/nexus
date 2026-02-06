// features/auth/data/datasources/auth_remote_data_source.dart
// 1/ Interface (The contract)
import 'package:nexus_social/core/error/exceptions.dart';
import 'package:nexus_social/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<UserModel?> getCurrentUser();

  Future<void> logout();
}

// 2.The implementation(The real Code)

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  // We ask for the superbaseClient in the constructors
  AuthRemoteDataSourceImpl(this.supabaseClient);

  // SIGNUP
  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // A.Talk to Superbase
      // We pass"name' in the data field because Superbase Auth only hass email/password by default extra goes to meta data
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      // B. Check for NUll
      if (response.user == null) {
        throw const ServerException('User is null!!');
      }

      // C.Convert to Model
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      // IF Superbase Fails , we throw our custom SeverException
      throw ServerException(e.toString());
    }
  }

  // LOGIN
  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw const ServerException('User is null!');
      }

      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // CURRENT USER
  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      // Supabase automatically persists the session on the phone.
      // This checks if we have a saved session.
      final user = supabaseClient.auth.currentUser;
      
      if (user == null) {
        return null;
      }
      
      return UserModel.fromJson(user.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
  // LOG OUT
  @override
  Future<void> logout() async {
    try {
      await supabaseClient.auth.signOut();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
