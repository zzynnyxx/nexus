// features/auth/presentation/widgets/auth_gradient_button.dart
// This is ou call to action button it uses a gradient to look modern and stands out aganist the dark background

import 'package:flutter/material.dart';
import 'package:nexus_social/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const AuthGradientButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppPallete.storyGradient,
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(385, 55),
          backgroundColor: AppPallete.transparent,
          shadowColor: AppPallete.transparent,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppPallete.white,
          ),
        ),
      ),
    );
  }
}
