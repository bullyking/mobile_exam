import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:mobile_exam/core/widgets/app_form_field.dart';
import 'package:mobile_exam/features/profile/bloc/profile_bloc.dart';

List<Widget> bankAccountDetailForm({
  required BuildContext context,
  required ProfileState profileState,
  TextEditingController? bankAccountNumberController,
  TextEditingController? accountHolderNameController,
  TextEditingController? ifscCodeController,
}) {
  return [
    Text(
      'Bank Account Details',
      style: AppTheme.font.mitrS20.copyWith(
        color: AppTheme.color.primaryTextColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    const Gap(AppTheme.sizeXL),
    AppFormField(
      title: 'Bank Account Number',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: bankAccountNumberController,
      onChanged: (value) {
        context.read<ProfileBloc>().add(HandleBankAccountNumberChangeEvent(bankAccountNumber: value));
      },
    ),
    const Gap(AppTheme.sizeXL),
    AppFormField(
      title: "Account Holder's Name",
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: accountHolderNameController,
      onChanged: (value) {
        context.read<ProfileBloc>().add(HandleAccountHolderNameChangeEvent(accountHolderName: value));
      },
    ),
    const Gap(AppTheme.sizeM),
    AppFormField(
      title: 'IFSC Code',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      controller: ifscCodeController,
      onChanged: (value) {
        context.read<ProfileBloc>().add(HandleIFSCCodeChangeEvent(iFSCCode: value));
      },
    ),
    const Gap(AppTheme.sizeL * 20),
  ];
}
