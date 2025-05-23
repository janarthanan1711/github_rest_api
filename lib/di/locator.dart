import 'package:get_it/get_it.dart';
import 'package:github_repo/features/auth/application/usecases/get_user.dart';
import 'package:github_repo/features/auth/application/usecases/login_github.dart';
import 'package:github_repo/features/auth/application/usecases/logout_user.dart';
import 'package:github_repo/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:github_repo/features/auth/domain/repositories/auth_repo.dart';
import 'package:github_repo/features/repo/application/usecases/get_repository.dart';
import 'package:github_repo/features/repo/data/repo_impl/repo_impl.dart';
import 'package:github_repo/features/repo/data/repository/repo_data.dart';
import 'package:github_repo/features/repo/domain/repositories/repos_support.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Register repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  // Register use cases
  sl.registerLazySingleton(() => LoginWithGitHub(sl()));
  sl.registerLazySingleton(() => GetLoggedInUser(sl()));
  sl.registerLazySingleton(() => LogoutUser(sl()));

  // sl.registerFactory(() => RepoBloc());
  // sl.registerLazySingleton<RepoRemoteDataSource>(() => RepoRemoteDataSource());

  sl.registerLazySingleton<GithubRepository>(
    () => RepoRepositoryImpl(sl<RepoRemoteDataSource>()),
  );

  // sl.registerLazySingleton<GetRepositories>(
  //   () => GetRepositories(sl<GithubRepository>()),
  sl.registerLazySingleton(() => GetRepositories(sl()));
}
