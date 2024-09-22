import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:mobile_exam/core/widgets/app_form_field.dart';
import 'package:mobile_exam/features/profile/bloc/profile_bloc.dart';
import 'package:mobile_exam/features/share_widgets/separate_line.dart';

List<Widget> addressDetailForm({
  required BuildContext context,
  required ProfileState profileState,
  TextEditingController? pincodeController,
  TextEditingController? addressController,
  TextEditingController? cityController,
  TextEditingController? stateController,
  TextEditingController? countryController,
}) {
  return [
    Text(
      'Address Details',
      style: AppTheme.font.mitrS20.copyWith(
        color: AppTheme.color.primaryTextColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    const Gap(AppTheme.sizeXL),
    AppFormField(
      title: 'Pincode',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: pincodeController,
      onChanged: (value) {
        context.read<ProfileBloc>().add(HandlePincodeChangeEvent(pincode: value));
      },
    ),
    const Gap(AppTheme.sizeXL),
    AppFormField(
      title: 'Address',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: addressController,
      onChanged: (value) {
        context.read<ProfileBloc>().add(HandleAddressChangeEvent(address: value));
      },
    ),
    const Gap(AppTheme.sizeM),
    AppFormField(
      title: 'City',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: cityController,
      onChanged: (value) {
        context.read<ProfileBloc>().add(HandleCityChangeEvent(city: value));
      },
    ),
    const Gap(AppTheme.sizeM),
    AppFormField(
      title: 'State',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: stateController,
      onChanged: (value) {
        context.read<ProfileBloc>().add(HandleStateChangeEvent(state: value));
      },
    ),
    const Gap(AppTheme.sizeM),
    AppFormField(
      title: 'Country',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      controller: countryController,
      onChanged: (value) {
        context.read<ProfileBloc>().add(HandleCountryChangeEvent(country: value));
      },
    ),
    const Gap(AppTheme.sizeL),
    const SeparateLine(),
  ];
}
