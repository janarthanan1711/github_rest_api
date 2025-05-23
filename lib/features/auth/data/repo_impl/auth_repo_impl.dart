import 'package:github_repo/db/local_db.dart';
import 'package:github_repo/features/auth/data/repository/auth_data.dart';
import 'package:github_repo/features/auth/domain/models/user_token.dart';
import 'package:github_repo/features/auth/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<UserToken> loginWithGitHub(String code) async {
    final token = await AuthRemoteDataSource().exchangeCodeForToken(code);
    await AppSharedPreference.setToken(token);
    return UserToken(token: token);
  }

  @override
  Future<UserToken?> getLoggedInUser() async {
    final token = await AppSharedPreference.getToken();
    return UserToken(token: token);
  }

  @override
  Future<void> logout() async {
    await AppSharedPreference.clearToken();
  }
}
