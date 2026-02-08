// init_dependencies.dart
import 'package:get_it/get_it.dart';
import 'package:nexus_social/core/secrets/app_secrets.dart'; // Make sure you have your secrets file
import 'package:nexus_social/features/auth/auth.dart';
import 'package:nexus_social/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nexus_social/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:nexus_social/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// 1. Create the Service Locator (The "Toolbox")
final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();

  // 2. Initialize Supabase
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  // Register Supabase Client so we can access it anywhere
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  // DATASOURCE
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(), // Automatically injects SupabaseClient
      ),
    )
    // REPOSITORY
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(), // Automatically injects DataSource
      ),
    )
    // USECASES
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(), // Automatically injects Repository
      ),
    )
    ..registerFactory(
      () => UserLogin(
        serviceLocator(), 
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(), 
      ),
    )
    // BLOC
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        // appUserCubit: serviceLocator(), // Wait, do we have AppUserCubit? 
        // NOTE: If we haven't created AppUserCubit yet, remove it from AuthBloc constructor
        // or let's double check your AuthBloc constructor.
      ),
    );
}