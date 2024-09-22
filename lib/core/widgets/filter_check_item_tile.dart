import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';

class FilterCheckItemTile extends StatelessWidget {
  const FilterCheckItemTile({
    Key? key,
    required this.title,
    this.iconValue,
    this.borderWidth = 1,
    this.borderColor,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Icon? iconValue;
  final double borderWidth;
  final Color? borderColor;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppTheme.sizeM,
          horizontal: 8.0,
        ).copyWith(right: AppTheme.sizeS),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: borderWidth,
              color: borderColor ?? AppTheme.color.tertiaryColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.sarabun(textStyle: AppTheme.font.mitrS14),
            ),
            SizedBox(
              height: 20.0,
              child: isSelected ? iconValue ?? Icon(Icons.check, color: AppTheme.color.primaryColor, size: 24.0) : null,
            )
          ],
        ),
      ),
    );
  }
}
