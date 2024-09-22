import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mobile_exam/core/enums/main_enums.dart';
import 'package:mobile_exam/core/services/dialog_service.dart';
import 'package:mobile_exam/core/themes/app_theme.dart';
import 'package:mobile_exam/core/widgets/app_confirm_dialog.dart';
import 'package:mobile_exam/core/widgets/button/app_button.dart';
import 'package:mobile_exam/core/widgets/loading_widget.dart';
import 'package:mobile_exam/features/profile/bloc/profile_bloc.dart';
import 'package:mobile_exam/features/profile/profile_list/widgets/profile_info_card.dart';
import 'package:mobile_exam/features/profile/router/profile_routes.dart';
import 'package:mobile_exam/main.dart';

class ProfileListScreen extends StatefulWidget {
  const ProfileListScreen({super.key});

  @override
  State<ProfileListScreen> createState() => _ProfileListScreenState();
}

class _ProfileListScreenState extends State<ProfileListScreen> {
  Future<void> _onRefresh() async {
    context.read<ProfileBloc>().add(const FetchProfileListEvent());
  }

  @override
  Widget build(BuildContext context) {
    // make list profile
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: BlocProvider.of<ProfileBloc>(context),
      buildWhen: (prev, curr) => prev.profileList != curr.profileList,
      builder: (context, state) {
        final profileList = state.profileList ?? [];

        if (state.status.isLoading) {
          return const LoadingWidget();
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.color.primaryColor,
            title: Text(
              'Profile List',
              style: AppTheme.font.mitrS18.copyWith(
                color: AppTheme.color.whiteColor,
              ),
            ),
          ),
          body: profileList.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: _onRefresh,
                  child: ListView.builder(
                    itemCount: profileList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: ProfileInfoCardWidget(
                          title: profileList[index].bankAccountDetail?.accountHolderName ?? '-',
                          onTapView: () {
                            // navigate to detail screen
                            FocusScope.of(context).unfocus();

                            navigatorKey.currentState?.pushNamed('/profile/detail',
                                arguments: ProfileArguments(
                                  id: profileList[index].personDetail?.profileId,
                                  processType: ProcessType.update,
                                ));
                          },
                          onTapUpdate: () async {
                            // navigate to detail screen
                            FocusScope.of(context).unfocus();

                            navigatorKey.currentState?.pushNamed('/profile/form',
                                arguments: ProfileArguments(
                                  id: profileList[index].personDetail?.profileId,
                                  processType: ProcessType.update,
                                ));
                          },
                          onTapDelete: () async {
                            FocusScope.of(context).unfocus();

                            await showDialog(
                                context: context,
                                builder: (context) => AppConfirmDialog(
                                      title: 'ยืนยันการลบโปรไฟล์',
                                      onTap: () {
                                        context.read<ProfileBloc>().add(DeleteProfileEvent(
                                            profileId: profileList[index].personDetail?.profileId ?? 0,
                                            onSuccess: () {
                                              Navigator.pop(context);
                                              DialogService().showTopSnackbar(
                                                context: context,
                                                status: DialogStatus.success,
                                                content: "ลบโปรไฟล์สำเร็จ",
                                              );
                                            }));
                                      },
                                    ));
                          },
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ไม่พยข้อมูลโปรไฟล์',
                        style: AppTheme.font.mitrS24,
                      ),
                      AppButton(
                        title: 'โหลดข้อมูลใหม่อีกครั้ง',
                        onTap: () {
                          context.read<ProfileBloc>().add(const FetchProfileListEvent());
                        },
                      ),
                    ],
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppTheme.color.quaternaryColor,
            onPressed: () async {
              // navigate to add screen
              final result = await navigatorKey.currentState?.pushNamed('/profile/form',
                  arguments: const ProfileArguments(
                    id: 0,
                    processType: ProcessType.create,
                  ));
              if (result != null) {
                DialogService().showTopSnackbar(
                  context: context,
                  status: DialogStatus.success,
                  content: "เพิ่มโปรไฟล์สำเร็จ",
                );
              }
            },
            child: Icon(
              Icons.add,
              color: AppTheme.color.secondaryColor,
            ),
          ),
        );
      },
    );
  }
}
