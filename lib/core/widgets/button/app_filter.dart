import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';

class FilterButtonStyle extends StatelessWidget {
  const FilterButtonStyle({
    super.key,
    required this.title,
    this.subTitle,
    this.topic = '',
    required this.onTap,
    this.textSize = AppTheme.sizeM,
    this.textColor,
    this.subTextColor,
    this.bgColor = Colors.white,
    this.borderColor,
    this.topicSize = AppTheme.sizeS,
    this.iconValue = Icons.chevron_right,
    this.iconColor,
  });

  final String title;
  final String? subTitle;
  final String topic;
  final double textSize;
  final Color? textColor;
  final Color? subTextColor;
  final Color bgColor;
  final Color? borderColor;
  final double topicSize;
  final IconData iconValue;
  final Function onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: topic != '',
            child: Text(
              topic,
              style: GoogleFonts.sarabun(textStyle: AppTheme.font.mitrS14).copyWith(
                  height: 1.5, fontSize: topicSize, color: AppTheme.color.textUnselectColor),
            )),
        SizedBox(height: topic != '' ? AppTheme.sizeS / 2 : 0),
        InkWell(
          onTap: () {
            onTap.call();
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: borderColor ?? AppTheme.color.primaryLineColor,
              ),
              color: bgColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.sizeS),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SizedBox(
                      child: Text(
                        title,
                        style: GoogleFonts.sarabun(textStyle: AppTheme.font.mitrS14).copyWith(
                            height: 1.85,
                            fontSize: textSize,
                            color: textColor ?? AppTheme.color.primaryBlackColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text(
                    subTitle?.replaceAll("", "\u200B") ?? '',
                    style: GoogleFonts.sarabun(textStyle: AppTheme.font.mitrS14).copyWith(
                        height: 1.5,
                        fontSize: textSize,
                        color: subTextColor ?? AppTheme.color.primaryBlackColor,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Icon(iconValue, color: iconColor ?? AppTheme.color.primaryColorShade)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
