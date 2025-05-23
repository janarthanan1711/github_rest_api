import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo/common/app_constants.dart';
import 'package:github_repo/common/app_routes.dart';
import 'package:github_repo/common/app_themes.dart';
import 'package:github_repo/core/utils/connectivity_check.dart';
import 'package:github_repo/features/auth/application/auth_bloc.dart';
import 'package:github_repo/features/branch/application/branch_bloc.dart';
import 'package:github_repo/features/onboard/application/onboard_bloc.dart';
import 'package:github_repo/features/onboard/presentation/pages/onboard_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => OnboardBloc()),
        BlocProvider(create: (context) => BranchBloc()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.applicationDefaultTheme(context),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        onUnknownRoute: AppRoutes.onUnknownRoute,
        initialRoute: OnboardPage.routeName,
        title: AppConstants.title,
        themeMode: ThemeMode.light,
        darkTheme: AppThemes.darkTheme(context),
      ),
    );
  }
}
