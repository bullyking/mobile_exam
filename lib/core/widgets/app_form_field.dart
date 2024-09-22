import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';

class AppFormField extends StatelessWidget {
  const AppFormField({
    super.key,
    this.controller,
    this.title,
    this.borderColor,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.onChanged,
    this.focusNode,
  });
  final TextEditingController? controller;
  final String? title;
  final Color? borderColor;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Function(String)? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Text(
            title!,
            style: GoogleFonts.mitr(
              fontSize: 14,
              color: AppTheme.color.primaryTextColor,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: controller,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  obscureText: obscureText ?? false,
                  focusNode: focusNode,
                  strutStyle: const StrutStyle(
                    height: 1.9,
                  ),
                  decoration: InputDecoration(
                    // prefixIcon: const Icon(Icons.start),
                    labelText: '',
                    filled: true,
                    errorText: errorText,
                    errorStyle: GoogleFonts.mitr(
                      fontSize: 0.001,
                      fontWeight: FontWeight.w300,
                      color: Colors.transparent,
                    ),
                    hintText: null,
                    hintStyle: GoogleFonts.mitr(
                      fontSize: AppTheme.sizeM,
                      fontWeight: FontWeight.w300,
                      color: AppTheme.color.primaryTextColor,
                    ),
                    counterText: "",
                    isDense: true,
                    contentPadding: const EdgeInsets.only(right: 10, left: 10, top: 11, bottom: 10),
                    labelStyle: GoogleFonts.mitr(
                      fontSize: 12,
                      color: AppTheme.color.primaryTextColor,
                    ),
                    constraints:
                        const BoxConstraints(maxHeight: 40, minHeight: 40, maxWidth: double.infinity, minWidth: double.infinity),
                    fillColor: AppTheme.color.whiteColor,
                    // filled: widget.fillColor != null || !widget.enable,
                    suffixIcon: null,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppTheme.color.tertiaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: borderColor ?? AppTheme.color.borderColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppTheme.color.tertiaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.color.borderColor), borderRadius: BorderRadius.circular(8)),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppTheme.color.statusColorError.withOpacity(1)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: AppTheme.color.statusColorError.withOpacity(0.6)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: GoogleFonts.mitr(
                    textStyle: AppTheme.font.mitrS14,
                    height: 1.6,
                    letterSpacing: 0.4,
                  ),
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
