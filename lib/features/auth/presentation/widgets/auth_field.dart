// features/auth/presentation/widgets/auth_field.dart
// This is our custom text box .it handles the styling and validation (checing if the box is empty)

import 'package:flutter/material.dart';
import 'package:nexus_social/core/theme/app_pallete.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        // default Border
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color:AppPallete.grey, width: 3),
        ),
        // 2. Enabled border (Same as default but explicit)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color:AppPallete.grey, width: 3),
        ),
        // 2.Focused Border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppPallete.primaryPurple, width: 3),
        ),
        // Big spacious padding
        contentPadding: const EdgeInsets.all(27),
      ),
      // The Validator (Automatic Error Checking)
      validator: (value){
        if (value!.isEmpty) {
          return" $hintText is missing!! ";
        }
        return null;
      },
    );
  }
}
