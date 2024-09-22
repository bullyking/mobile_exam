import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:mobile_exam/core/widgets/button/app_button.dart';

class AppConfirmDialog extends StatelessWidget {
  const AppConfirmDialog({
    super.key,
    this.title,
    this.confirmText = 'ตกลง',
    this.cancelText = 'ยกเลิก',
    this.onTap,
  });

  final String? title;
  final String? confirmText;
  final String? cancelText;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.sizeM),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: SizedBox(
        width: 348.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.sizeL,
            vertical: AppTheme.sizeL * 2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  title ?? '',
                  style: AppTheme.font.mitrS20,
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(AppTheme.sizeL),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      title: cancelText,
                      bgColor: AppTheme.color.secondaryColor.withOpacity(.1),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const Gap(AppTheme.sizeL),
                  Expanded(
                    child: AppButton(
                      title: confirmText,
                      bgColor: AppTheme.color.tertiaryColor,
                      onTap: () => onTap != null ? onTap?.call() : {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
