import 'package:flutter/material.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:curved_progress_bar/curved_progress_bar.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.isUseToAppBar = false, this.backgroundColor = Colors.white});

  final Color? backgroundColor;
  final bool isUseToAppBar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: backgroundColor,
        alignment: Alignment.center,
        child: CurvedCircularProgressIndicator(
          strokeWidth: 4,
          backgroundColor: AppTheme.color.secondaryColor,
          color: AppTheme.color.tertiaryColor,
        ),
      ),
    );
  }
}
