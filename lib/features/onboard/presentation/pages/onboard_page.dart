import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo/common/app_images.dart';
import 'package:github_repo/features/auth/presentation/pages/signin_page.dart';
import 'package:github_repo/features/onboard/application/onboard_bloc.dart';
import 'package:github_repo/features/repo/presentation/pages/repo_list_page.dart';

class OnboardPage extends StatefulWidget {
  static const String routeName = '/onboardPage';

  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => OnboardBloc()..add(LoaderGetLocalDataEvent()),
      child: BlocListener<OnboardBloc, OnboardState>(
        listener: (context, state) {
          if (state is LoaderSuccessState) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Future.delayed(const Duration(seconds: 2), () {
                if (!context.mounted) return;
                if (!state.loginStatus) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AuthPage.routeName,
                    (route) => false,
                  );
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RepoListPage.routeName,
                    (route) => false,
                  );
                }
              });
            });
          }
        },
        child: BlocBuilder<OnboardBloc, OnboardState>(
          builder: (context, state) {
            return PopScope(
              canPop: false,
              child: Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                resizeToAvoidBottomInset: false,
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.logo,
                        width: size.width * 0.51,
                        height: size.height * 0.51,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
