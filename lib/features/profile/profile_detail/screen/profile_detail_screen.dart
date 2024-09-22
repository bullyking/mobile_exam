import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:mobile_exam/features/profile/bloc/profile_bloc.dart';
import 'package:mobile_exam/features/share_widgets/separate_line.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: AppTheme.color.whiteColor),
              backgroundColor: AppTheme.color.primaryColor,
              title: Text('Profile Detail', style: AppTheme.font.mitrS18.copyWith(color: AppTheme.color.whiteColor)),
            ),
            body: Container(
              padding: const EdgeInsets.all(AppTheme.sizeM),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Gap(AppTheme.sizeL),
                Text('Personal Detail', style: AppTheme.font.mitrS18.copyWith(color: AppTheme.color.primaryColor)),

                const Gap(AppTheme.sizeM),
                Text('Email: ${state.profile?.personDetail?.email}', style: AppTheme.font.mitrS14),
                const Gap(AppTheme.sizeM),
                Text('Sex: ${state.profile?.personDetail?.sex}', style: AppTheme.font.mitrS14),
                const Gap(AppTheme.sizeL),

                const SeparateLine(),

                Text('Address Detail', style: AppTheme.font.mitrS18.copyWith(color: AppTheme.color.primaryColor)),
                const Gap(AppTheme.sizeM),
                Text('Address: ${state.profile?.addressDetail?.address}', style: AppTheme.font.mitrS14),
                const Gap(AppTheme.sizeM),
                Text('State: ${state.profile?.addressDetail?.state}', style: AppTheme.font.mitrS14),
                const Gap(AppTheme.sizeM),
                Text('City: ${state.profile?.addressDetail?.city}', style: AppTheme.font.mitrS14),
                const Gap(AppTheme.sizeM),
                Text('Country: ${state.profile?.addressDetail?.country}', style: AppTheme.font.mitrS14),
                const Gap(AppTheme.sizeL),
                const SeparateLine(),

                // bank account detail
                Text('Bank Account Detail', style: AppTheme.font.mitrS18.copyWith(color: AppTheme.color.primaryColor)),
                const Gap(AppTheme.sizeM),
                Text('Account Holder Name: ${state.profile?.bankAccountDetail?.accountHolderName}', style: AppTheme.font.mitrS14),
                const Gap(AppTheme.sizeM),
                Text('Account Number: ${state.profile?.bankAccountDetail?.bankAccountNumber}', style: AppTheme.font.mitrS14),
                const Gap(AppTheme.sizeM),
                Text('IFSC Code: ${state.profile?.bankAccountDetail?.iFSCCode}', style: AppTheme.font.mitrS14),
              ]),
            ));
      },
    );
  }
}
