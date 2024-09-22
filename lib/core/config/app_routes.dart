import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_exam/features/profile/bloc/profile_bloc.dart';
import 'package:mobile_exam/features/profile/profile_detail/screen/profile_detail_screen.dart';
import 'package:mobile_exam/features/profile/profile_form/screen/gender_list_screen.dart';
import 'package:mobile_exam/features/profile/profile_form/screen/profile_form_screen.dart';
import 'package:mobile_exam/features/profile/router/profile_routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/profile/form': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as ProfileArguments;
    return BlocProvider.value(
      value: context.read<ProfileBloc>(),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return ProfileFormScreen(args: args);
        },
      ),
    );
  },
  '/gender/list': (context) {
    return const GenderListScreen();
  },
  '/profile/detail': (context) {
    final args = ModalRoute.of(context)?.settings.arguments as ProfileArguments;
    return BlocProvider.value(
      value: context.read<ProfileBloc>()..add(FetchProfileFormEvent(id: args.id, processType: args.processType)),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return const ProfileDetailScreen();
        },
      ),
    );
  },
};
