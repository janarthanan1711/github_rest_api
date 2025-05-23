import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:github_repo/core/utils/custom_loader.dart';
import 'package:github_repo/features/auth/application/auth_bloc.dart';
import 'package:github_repo/features/repo/presentation/pages/repo_list_page.dart';

class AuthPage extends StatelessWidget {
  static const String routeName = '/authPage';
  const AuthPage({super.key});

  final String authUrl =
      'https://github.com/login/oauth/authorize?client_id=Ov23liCNMiykNLqADnFL&scope=repo';
  final String redirectUrl = 'myapp://callback'; // Must match GitHub App

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc()..add(AppStarted()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacementNamed(context, RepoListPage.routeName);
          } else if (state is AuthError) {
            CustomLoader.dismiss(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('GitHub OAuth Login')),
          body: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              // Always show the WebView
              return InAppWebView(
                initialUrlRequest: URLRequest(url: WebUri(authUrl)),
                onLoadStop: (controller, url) {
                  if (url != null && url.toString().startsWith(redirectUrl)) {
                    final uri = Uri.parse(url.toString());
                    final code = uri.queryParameters['code'];
                    if (code != null) {
                      context.read<AuthBloc>().add(GitHubLoggedIn(code));
                    }
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
