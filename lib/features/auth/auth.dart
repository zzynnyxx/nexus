// features/auth/auth.dart
// The Barrel File
// This is the "Public Menu" of the Auth Feature.

// 1. Domain Layer (Public Logic)
export 'domain/entities/user_entity.dart';
export 'domain/repositories/auth_repository.dart';
export 'domain/usecases/login_usecase.dart';
export 'domain/usecases/signup_usecase.dart';
export 'domain/usecases/current_user_usecase.dart';

// 2. Presentation Layer (Public UI)
// We will uncomment these later when we create the screens
// export 'presentation/pages/login_page.dart';
// export 'presentation/state/auth_bloc.dart';

// NOTE: We do NOT export Data Layer (Models/DataSources).
// The outside world doesn't need to know about JSON or Supabase.