import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobile_exam/core/enums/main_enums.dart';
import 'package:mobile_exam/core/services/dialog_service.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:mobile_exam/core/widgets/button/app_button.dart';
import 'package:mobile_exam/features/profile/router/profile_routes.dart';

import '../../../../main.dart';

class ProfileInfoCardWidget extends StatelessWidget {
  const ProfileInfoCardWidget({
    super.key,
    this.title,
    this.onTapView,
    this.onTapUpdate,
    this.onTapDelete,
  });

  final String? title;
  final Function? onTapView;
  final Function? onTapUpdate;
  final Function? onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.sizeM, vertical: AppTheme.sizeL),
        decoration: BoxDecoration(
          color: AppTheme.color.quaternaryColor.withOpacity(.4),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppTheme.color.tertiaryColor,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? '',
              style: AppTheme.font.mitrS14,
            ),
            const Gap(AppTheme.sizeM),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  title: 'ดูโปรไฟล์',
                  onTap: () => onTapView != null ? onTapView?.call() : {},
                ),
                AppButton(
                  title: 'แก้ไขโปรไฟล์',
                  bgColor: AppTheme.color.statusColorWarning,
                  onTap: () => onTapUpdate != null ? onTapUpdate?.call() : {},
                ),
                AppButton(
                  title: 'ลบโปรไฟล์',
                  bgColor: AppTheme.color.statusColorError,
                  onTap: () => onTapDelete != null ? onTapDelete?.call() : {},
                )
              ],
            ),
          ],
        ));
  }
}
