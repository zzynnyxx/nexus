// core/widgets/loader.dart

import 'package:flutter/material.dart';
import 'package:nexus_social/core/theme/app_pallete.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
       color: AppPallete.primaryPurple,
      )
    );
  }
}