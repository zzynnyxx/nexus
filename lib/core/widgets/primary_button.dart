// core/widgets/primary_button.dart
import 'package:flutter/material.dart';
import 'package:nexus_social/core/theme/app_pallete.dart';

class PrimaryButton extends StatelessWidget {
  // 1.Define the data this button need to work
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      // button with consistent full width and height
      width: double.infinity,
      height: 50,
      // 2.The actual Button implementationn
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.primaryPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppPallete.white,
          ),
        ),
      ),
    );
  }
}
