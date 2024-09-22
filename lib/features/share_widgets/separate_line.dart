import 'package:flutter/material.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';

class SeparateLine extends StatelessWidget {
  const SeparateLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 1,
        decoration: BoxDecoration(
          color: AppTheme.color.borderColor,
        ),
      ),
    );
  }
}
