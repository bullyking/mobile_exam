import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_exam/core/enums/main_enums.dart';
import 'package:mobile_exam/core/enums/profile_enum.dart';
import 'package:mobile_exam/core/extension/string_extension.dart';
import 'package:mobile_exam/core/services/dialog_service.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:mobile_exam/core/widgets/app_confirm_dialog.dart';
import 'package:mobile_exam/core/widgets/app_form_field.dart';
import 'package:mobile_exam/core/widgets/bottom_sheet.dart';
import 'package:mobile_exam/core/widgets/button/app_button.dart';
import 'package:mobile_exam/core/widgets/button/app_filter.dart';
import 'package:mobile_exam/features/profile/bloc/profile_bloc.dart';
import 'package:mobile_exam/features/profile/profile_form/screen/gender_list_screen.dart';
import 'package:mobile_exam/features/share_widgets/separate_line.dart';

import '../../../../main.dart';

List<Widget> personDetailForm({
  required BuildContext context,
  required ProfileState profileState,
  TextEditingController? emailController,
  TextEditingController? passwordController,
  FocusNode? emailFocus,
  FocusNode? passwordFocus,
}) {
  final validateType = profileState.validateType ?? ValidateType.none;
  final sexType = profileState.profile?.personDetail?.sex ?? Gender.male;
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Personal Details',
          style: AppTheme.font.mitrS20.copyWith(
            color: AppTheme.color.primaryTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        // AppButton(
        //   title: 'mock data',
        //   onTap: () {
        //     context.read<ProfileBloc>().add(const HandleMockProfileEvent());
        //   },
        // )
      ],
    ),
    const Gap(AppTheme.sizeXL),
    AppFormField(
      title: 'Email',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      borderColor: profileState.profileFormState.emailField.value.isNullOrEmpty && validateType.isValidate
          ? AppTheme.color.statusColorError
          : AppTheme.color.borderColor,
      controller: emailController,
      focusNode: emailFocus,
      onChanged: (value) {
        context.read<ProfileBloc>().add(HandleEmailChangeEvent(
              email: value,
            ));
      },
    ),
    const Gap(AppTheme.sizeXL),
    AppFormField(
      title: 'Password',
      borderColor: profileState.profileFormState.passwordField.value.isNullOrEmpty && validateType.isValidate
          ? AppTheme.color.statusColorError
          : AppTheme.color.borderColor,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: passwordController,
      obscureText: true,
      onChanged: (value) {
        context.read<ProfileBloc>().add(HandlePasswordChangeEvent(
              password: value,
            ));
      },
    ),
    const Gap(AppTheme.sizeM),
    Row(
      children: [
        Expanded(
            child: FilterButtonStyle(
          topic: 'Sex',
          title: sexType.desc,
          textColor: profileState.profile?.personDetail?.sex.toString().isNullOrEmpty == false
              ? AppTheme.color.primaryBlackColor
              : AppTheme.color.textUnselectColor,
          borderColor: profileState.profile?.personDetail?.sex.toString().isNullOrEmpty == true && validateType.isValidate
              ? AppTheme.color.statusColorError
              : AppTheme.color.primaryLineColor,
          bgColor: AppTheme.color.whiteColor,
          iconColor: AppTheme.color.secondaryColor,
          onTap: () async {
            FocusScope.of(context).unfocus();
            final result = navigatorKey.currentState?.pushNamed('/gender/list');

            debugPrint('result: $result');
          },
        )),
      ],
    ),
    const Gap(AppTheme.sizeL),
    const SeparateLine(),
  ];
}
