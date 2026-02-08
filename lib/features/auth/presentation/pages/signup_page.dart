// features/auth/presentation/pages/signup_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexus_social/core/theme/app_pallete.dart';
import 'package:nexus_social/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nexus_social/features/auth/presentation/bloc/auth_event.dart';
import 'package:nexus_social/features/auth/presentation/bloc/auth_state.dart';
import 'package:nexus_social/features/auth/presentation/pages/login_page.dart';
import 'package:nexus_social/features/auth/presentation/widgets/auth_field.dart';
import 'package:nexus_social/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignupPage extends StatefulWidget {
  // 1. THE ROUTE METHOD
  static Route route() => MaterialPageRoute(
        builder: (context) => const SignupPage(),
      );

  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // 2. THE CONTROLLERS
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController(); // NEW: Name Bucket

  // 3. THE FORM KEY
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // 4. MEMORY CLEANUP
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose(); // NEW: Dispose Name
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar is optional, but helps if users want to go "Back"
      appBar: AppBar(), 
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        
        // 5. BLOC CONSUMER
        // Listens to the State Machine (AuthBloc)
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // A. FAILURE: Show Red Snackbar
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppPallete.error, 
                ),
              );
            }
            // B. SUCCESS: Show Green Snackbar
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Account Created!"),
                  backgroundColor: AppPallete.success,
                ),
              );
              // TODO: Navigate to Home Page later
            }
          },
          
          builder: (context, state) {
            // C. LOADING: Show Spinner
            // If the machine is working, don't show the form.
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(
                   color: AppPallete.primaryPurple,
                ),
              );
            }

            // D. FORM: Show Inputs
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up.',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // NEW: Name Field
                  AuthField(
                    hintText: 'Name',
                    controller: nameController,
                  ),
                  const SizedBox(height: 15),
                  
                  // Email Field
                  AuthField(
                    hintText: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(height: 15),
                  
                  // Password Field
                  AuthField(
                    hintText: 'Password',
                    controller: passwordController,
                    isObscureText: true,
                  ),
                  const SizedBox(height: 20),
                  
                  // Sign Up Button
                  AuthGradientButton(
                    buttonText: 'Sign Up',
                    onPressed: () {
                      // 1. Validate (Check if empty)
                      if (formKey.currentState!.validate()) {
                        // 2. Trigger Event
                        context.read<AuthBloc>().add(
                              AuthSignUp(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                name: nameController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  
                  // Navigation Link (Back to Login)
                  GestureDetector(
                    onTap: () {
                      // Navigate back to Login Page
                       Navigator.push(context, LoginPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppPallete.grey,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppPallete.primaryOrange, // Make it pop
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