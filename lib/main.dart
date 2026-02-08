// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexus_social/core/theme/app_pallete.dart';
import 'package:nexus_social/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nexus_social/features/auth/presentation/pages/login_page.dart';
import 'package:nexus_social/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 1. Initialize Supabase & Dependencies (The Wiring)
  await initDependencies();
  
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Wrap the App in MultiBlocProvider
    // This makes the AuthBloc available to EVERY page in the app.
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Nexus Social',
        debugShowCheckedModeBanner: false,
        // 3. Apply the Dark Theme
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppPallete.black,
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: const EdgeInsets.all(27),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppPallete.borderColor,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppPallete.gradient2,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // 4. Set the Starting Page
        home: const LoginPage(),
      ),
    );
  }
}