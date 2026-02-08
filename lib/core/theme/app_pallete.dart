// core/theme/app_pallete.dart

import 'package:flutter/material.dart';

class AppPallete {
  // 1.The Brand Identity
  static const Color primaryPurple = Color(0xFF833AB4);
  static const Color primaryRed = Color(0xFFFD1D1D);
  static const Color primaryOrange = Color(0xFFF77737);
  static const Color primaryYellow = Color(0xFFFFDC80);

  // We map 'gradient1' and 'gradient2' to your brand colors for the buttons
  static const Color gradient1 = primaryPurple;
  static const Color gradient2 = primaryRed;

  // A specific dark grey for input borders
  static const Color borderColor = Color.fromRGBO(52, 51, 67, 1);

  // 2.The Neutral Tones (Backgrounds & Text)
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(
    0xFF9E9E9E,
  ); //A subtle for secondary text (like "5 minutes ago")
  static const Color lightGrey = Color(
    0xFFEEEEEE,
  ); // A very light grey for dividers and background fills
  static const Color darkGrey = Color(
    0xFF424242,
  ); // A dark grey for text in Dark Mode
  // The "Skeleton" color for loading animations
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);

  // 3. Semantic Colors (Communicating Status)
  static const Color error = Color(
    0xFFD32F2F,
  ); // When something goes wrong, we use this specific red.
  static const Color success = Color(
    0xFF388E3C,
  ); // When something goes right (like "Posted Successfully"), we use this green.
  static const Color transparent =
      Colors.transparent; // Transparent (useful for overlays)

  // 4. The Famous "Story Gradient"
  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [primaryPurple, primaryRed, primaryOrange, primaryYellow],
  );
}
