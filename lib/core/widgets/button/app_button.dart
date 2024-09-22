import 'package:flutter/material.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.title,
    this.titleColor,
    this.bgColor,
    this.onTap,
  });

  final String? title;
  final Color? titleColor;
  final Color? bgColor;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap?.call() : {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppTheme.sizeL / 2, horizontal: AppTheme.sizeL / 2),
        decoration: BoxDecoration(color: bgColor ?? AppTheme.color.secondaryColor, borderRadius: BorderRadius.circular(8)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title ?? '',
            style: AppTheme.font.mitrS14.copyWith(color: titleColor ?? AppTheme.color.primaryBlackColor),
          ),
        ),
      ),
    );
  }
}
