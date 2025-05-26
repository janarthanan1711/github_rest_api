import 'package:flutter/material.dart';
import 'package:github_repo/common/app_arguments.dart';
import 'package:github_repo/core/error/error_page.dart';
import 'package:github_repo/features/auth/presentation/pages/signin_page.dart';
import 'package:github_repo/features/branch/presentation/pages/branch_details.dart';
import 'package:github_repo/features/onboard/presentation/pages/onboard_page.dart';
import 'package:github_repo/features/repo/presentation/pages/repo_list_page.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    late Route<dynamic> pageRoute;
    Object? arg = routeSettings.arguments;

    switch (routeSettings.name) {
      case OnboardPage.routeName:
        pageRoute = MaterialPageRoute(
          builder: (context) => const OnboardPage(),
        );
      case AuthPage.routeName:
        pageRoute = MaterialPageRoute(builder: (context) => const AuthPage());
        break;
      case RepoListPage.routeName:
        pageRoute = MaterialPageRoute(
          builder: (context) => const RepoListPage(),
        );
        break;
      case BranchDetailsPage.routeName:
        pageRoute = MaterialPageRoute(
          builder:
              (context) =>
                  BranchDetailsPage(args: arg as BranchDetailsPageArguments),
        );
        break;
      default:
        pageRoute = MaterialPageRoute(builder: (context) => const ErrorPage());
    }
    return pageRoute;
  }

  static Route<dynamic> onUnknownRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(builder: (context) => const ErrorPage());
  }
}
