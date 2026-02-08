// features/auth/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexus_social/core/theme/app_pallete.dart';
import 'package:nexus_social/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nexus_social/features/auth/presentation/bloc/auth_event.dart';
import 'package:nexus_social/features/auth/presentation/bloc/auth_state.dart';
import 'package:nexus_social/features/auth/presentation/pages/signup_page.dart'; // UNCOMMENT THIS LATER
import 'package:nexus_social/features/auth/presentation/widgets/auth_field.dart';
import 'package:nexus_social/features/auth/presentation/widgets/auth_gradient_button.dart';

class LoginPage extends StatefulWidget {
  // A helper function to make navigation easier
  static Route route() => MaterialPageRoute(builder: (context) => const LoginPage());

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 1. Controllers (To capture text)
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // 2. Form Key (To validate inputs)
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Always clean up controllers to prevent memory leaks
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is the basic page structure
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // A. LISTEN FOR ERRORS
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppPallete.error, // Use your palette red
                ),
              );
            }
            // B. LISTEN FOR SUCCESS
            if (state is AuthSuccess) {
              // We will navigate to Home Page here later!
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Login Successful!"),
                  backgroundColor: AppPallete.success, // Use your palette green
                ),
              );
            }
          },
          builder: (context, state) {
            // C. SHOW LOADER
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppPallete.primaryPurple,
                ),
              );
            }

            // D. SHOW FORM
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // TITLE
                  const Text(
                    'Sign In.',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.white, // Use your palette
                    ),
                  ),
                  const SizedBox(height: 30),

                  // EMAIL FIELD
                  AuthField(
                    hintText: 'Email',
                    controller: emailController,
                    isObscureText: false,
                  ),
                  const SizedBox(height: 15),

                  // PASSWORD FIELD
                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    isObscureText: true, // Hide password dots
                  ),

                  const SizedBox(height: 20),

                  // SIGN IN BUTTON
                  AuthGradientButton(
                    buttonText: 'Sign In',
                    onPressed: () {
                      // Check if fields are  empty
                      if (formKey.currentState!.validate()) {
                        // SEND THE EVENT TO THE BLOC
                        context.read<AuthBloc>().add(
                          AuthLogin(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),

                  // NAVIGATION TEXT
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, SignupPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppPallete.grey),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color:
                                      AppPallete.primaryOrange, // Make it pop
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
