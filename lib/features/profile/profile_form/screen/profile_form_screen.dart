import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_exam/core/enums/main_enums.dart';
import 'package:mobile_exam/core/services/dialog_service.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:gap/gap.dart';
import 'package:mobile_exam/core/widgets/button/app_button.dart';
import 'package:mobile_exam/core/widgets/loading_widget.dart';
import 'package:mobile_exam/features/profile/bloc/profile_bloc.dart';
import 'package:mobile_exam/features/profile/profile_form/widgets/address_detail_form.dart';
import 'package:mobile_exam/features/profile/profile_form/widgets/bank_account_detail_form.dart';
import 'package:mobile_exam/features/profile/profile_form/widgets/person_detail_form.dart';
import 'package:mobile_exam/features/profile/router/profile_routes.dart';

class ProfileFormScreen extends StatefulWidget {
  const ProfileFormScreen({
    super.key,
    required this.args,
  });

  final ProfileArguments args;

  @override
  State<ProfileFormScreen> createState() => _ProfileFormScreenState();
}

class _ProfileFormScreenState extends State<ProfileFormScreen> {
  // personal controller
  late final emailController = TextEditingController(text: null);
  late final passwordController = TextEditingController(text: null);

  // address controller
  late final pincodeController = TextEditingController(text: null);
  late final addressController = TextEditingController(text: null);
  late final cityController = TextEditingController(text: null);
  late final stateController = TextEditingController(text: null);
  late final countryController = TextEditingController(text: null);

  // bank account controller
  late final bankAccountNumberController = TextEditingController(text: null);
  late final accountHolderNameController = TextEditingController(text: null);
  late final ifscCodeController = TextEditingController(text: null);

  late final FocusNode emailFocus;
  late final FocusNode passwordFocus;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfileFormEvent(id: widget.args.id, processType: widget.args.processType));
    emailFocus = FocusNode();
    passwordFocus = FocusNode();

    final profileState = context.read<ProfileBloc>().state;
    final processType = profileState.processType ?? ProcessType.create;

    if (processType.isUpdate) {
      // personal detail
      emailController.text = profileState.profileFormState.emailField.value ?? '';
      passwordController.text = profileState.profileFormState.passwordField.value ?? '';

      // address detail
      pincodeController.text = profileState.profileFormState.pincodeField.value ?? '';
      addressController.text = profileState.profileFormState.addressField.value ?? '';
      cityController.text = profileState.profileFormState.cityField.value ?? '';
      stateController.text = profileState.profileFormState.stateField.value ?? '';
      countryController.text = profileState.profileFormState.countryField.value ?? '';

      // bank account detail
      bankAccountNumberController.text = profileState.profileFormState.bankAccountNumberField.value ?? '';
      accountHolderNameController.text = profileState.profileFormState.accountHolderNameField.value ?? '';
      ifscCodeController.text = profileState.profileFormState.ifscCodeField.value ?? '';
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocus.dispose();
    passwordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, profileState) {
        if (profileState.status.isMockSuccess || profileState.status.isMapDataSuccess) {
          // personal detail
          emailController.text = profileState.profileFormState.emailField.value ?? '';
          passwordController.text = profileState.profileFormState.passwordField.value ?? '';

          // address detail
          pincodeController.text = profileState.profileFormState.pincodeField.value ?? '';
          addressController.text = profileState.profileFormState.addressField.value ?? '';
          cityController.text = profileState.profileFormState.cityField.value ?? '';
          stateController.text = profileState.profileFormState.stateField.value ?? '';
          countryController.text = profileState.profileFormState.countryField.value ?? '';

          // bank account detail
          bankAccountNumberController.text = profileState.profileFormState.bankAccountNumberField.value ?? '';
          accountHolderNameController.text = profileState.profileFormState.accountHolderNameField.value ?? '';
          ifscCodeController.text = profileState.profileFormState.ifscCodeField.value ?? '';
        } else if (profileState.status.isCreateSuccess || profileState.status.isUpdateSuccess) {
          Navigator.of(context).pop('saveSuccess');
          DialogService().showTopSnackbar(
            context: context,
            status: DialogStatus.success,
            content: '${profileState.status.isCreateSuccess ? 'เพิ่ม' : 'อัพเดท'} โปรไฟล์สำเร็จ',
          );
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        buildWhen: (prev, curr) => prev.profileFormState != curr.profileFormState,
        bloc: context.read<ProfileBloc>(),
        builder: (context, state) {
          if (state.status.isLoading) {
            return const LoadingWidget();
          }

          return Scaffold(
            backgroundColor: AppTheme.color.whiteColor,
            appBar: AppBar(
              iconTheme: IconThemeData(color: AppTheme.color.whiteColor),
              backgroundColor: AppTheme.color.primaryColor,
              title: Text(
                'Profile Form',
                style: AppTheme.font.mitrS18.copyWith(
                  color: AppTheme.color.whiteColor,
                ),
              ),
            ),
            body: Container(
              constraints: const BoxConstraints.tightFor(width: 480),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.sizeM),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      ...personDetailForm(
                        context: context,
                        profileState: state,
                        emailController: emailController,
                        passwordController: passwordController,
                        emailFocus: emailFocus,
                        passwordFocus: passwordFocus,
                      ),
                      ...addressDetailForm(
                        context: context,
                        profileState: state,
                        pincodeController: pincodeController,
                        addressController: addressController,
                        cityController: cityController,
                        stateController: stateController,
                        countryController: countryController,
                      ),
                      ...bankAccountDetailForm(
                        context: context,
                        profileState: state,
                        bankAccountNumberController: bankAccountNumberController,
                        accountHolderNameController: accountHolderNameController,
                        ifscCodeController: ifscCodeController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(bottom: AppTheme.sizeM).copyWith(
                left: AppTheme.sizeM,
                right: AppTheme.sizeM,
              ),
              width: double.infinity,
              height: 50,
              child: AppButton(
                onTap: () {
                  FocusScope.of(context).unfocus();

                  if (state.profileFormState.isFormValid == false) {
                    context.read<ProfileBloc>().add(HandleInvalidFormEvent(onSuccess: () {
                      if (state.profileFormState.emailField.invalid) {
                        emailFocus.requestFocus();
                      } else if (state.profileFormState.passwordField.invalid) {
                        passwordFocus.requestFocus();
                      }
                      DialogService().showTopSnackbar(
                        context: context,
                        status: DialogStatus.error,
                        content: 'ไม่สามารถบันทึกข้อมูลได้ กรุณากรอก Email และ Password',
                      );
                    }));
                  } else {
                    context.read<ProfileBloc>().add(CreateOrUpdateProfileEvent(onSuccess: () {}));
                  }
                },
                bgColor: Colors.blue,
                title: 'Save',
                titleColor: AppTheme.color.whiteColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
