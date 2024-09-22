import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_exam/core/enums/profile_enum.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:mobile_exam/core/widgets/button/app_button.dart';
import 'package:mobile_exam/core/widgets/filter_check_item_tile.dart';
import 'package:mobile_exam/features/profile/bloc/profile_bloc.dart';

class GenderListScreen extends StatelessWidget {
  const GenderListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.color.whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.color.whiteColor),
        backgroundColor: AppTheme.color.primaryColor,
        title: Text('เพศ', style: AppTheme.font.mitrS18.copyWith(color: AppTheme.color.whiteColor)),
      ),
      body: Column(
        children: [
          const Gap(AppTheme.sizeL),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              color: Colors.white,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// List Character status
                ListGenderView(),
                Gap(AppTheme.sizeL),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: AppTheme.sizeM).copyWith(
          left: AppTheme.sizeM,
          right: AppTheme.sizeM,
        ),
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: AppButton(
                bgColor: Colors.blue,
                titleColor: AppTheme.color.whiteColor,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  context.read<ProfileBloc>().add(HandleSaveGenderEvent(onSuccess: () {
                    Navigator.pop(context);
                  }));
                },
                title: 'ยืนยัน',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListGenderView extends StatelessWidget {
  const ListGenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileState = context.watch<ProfileBloc>().state;

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.sizeL),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Gender.values.length,
      itemBuilder: ((context, index) {
        return FilterCheckItemTile(
          title: Gender.values[index].name,
          isSelected: profileState.tempGender == Gender.values[index],
          iconValue: Icon(Icons.check, color: AppTheme.color.primaryColor),
          borderColor: (Gender.values.length - 1) == index ? Colors.white : AppTheme.color.primaryLineColor,
          onTap: () {
            FocusScope.of(context).unfocus();
            context.read<ProfileBloc>().add(HandleGenderChangeEvent(sex: Gender.values[index]));
          },
        );
      }),
      separatorBuilder: (context, index) {
        return const SizedBox.shrink();
      },
    );
  }
}
